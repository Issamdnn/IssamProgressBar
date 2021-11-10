// All rights reseved to Eng.Issam adnan Engissamadnan@gmail.com
// Source is open to all users with only one condition  (mention the Author)..
//2021 - 







// Test Colors $000000DF , $000080FF, $0000A400, $00C6C600



unit IssamProgressBar;

interface

uses
  SysUtils, Windows, Messages, Classes,
  Graphics, Controls, Forms, Dialogs,Math,ExtCtrls;

  type

    PTriVertex = ^TTriVertex;
    TTriVertex = record
    X, Y: DWORD;
    Red, Green, Blue, Alpha: WORD;


  end;



    type

    TColorSection=class(TCollectionItem)

    private
    Fcolor :TColor;
    FTextColor:TColor;
    FText :string;
    FShowText:Boolean;
    FOnChange:TNotifyEvent;
    FOwner:TPersistent;
    procedure SetColor(Value:TColor);
    procedure SetText(Value:String);
    procedure SetShowText(Value:Boolean);
    procedure SetTextColor(Value:TColor);
    public
    constructor Create(Collection: TCollection);override;
    published
    property Color:TColor read Fcolor write SetColor;
    property Text:string  read FText write SetText;
    property ShowText:Boolean read FShowText write SetShowText;
    property TextColor:TColor read FTextColor write SetTextColor;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    end;

    type

    TSectionsColors=class (TCollection)
    private
    FOwner: TPersistent;
    FOnChange:TNotifyEvent;
    function GetItem(Index: Integer): TColorSection;
    procedure SetItem(Index: Integer; Value: TColorSection);
    protected
    function GetOwner: TPersistent; override;
    procedure Assign(Other: TPersistent);override;
    public
    constructor Create(AOwner: TPersistent);
    procedure Notify(Item: TCollectionItem; Action: TCollectionNotification);override;
    function Add: TColorSection;
    property Items[Index: Integer]: TColorSection read GetItem write SetItem; default;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;


   end;





  type
   TBevelOuter=(bvNone,bvRaised,bvLowred) ;
   TMBorderStyle=(BsRound,BsRectagle);
   TBlockStyle=(BBsRound,BBsCircle,BBsRectangle);
   TProgressFillSyle=(PfSolidFill,PfGradientFill,PfSections);
   TGradientDirection=(gdVertical,gdHorizontal,gdMidHorizontal,gdMidVertical) ;
   TOnProgressEvent = procedure(Sender:TObject;const Progress: Integer) of object;
   TTextAlignemnt=(txLeft,txRight,txCenter);
   TCandyDirection=(cdLeft,cdRight);
   TTriangle=array[0..2] Of TPoint;
   TFourangle=array[0..3] of TPoint;
   TProgressShape=(psRecangle,psCircle,psSectors) ;






   type

   TCandyEffect=class(TPersistent)
   private
   FCandyEffect:Boolean;
   FCandyDirection:TCandyDirection;
   FCandyFisrtColor,FCandySecondColor:TColor;
   FPen:Boolean;
   FOnChange: TNotifyEvent;
   procedure SetCandyEffect(Value:Boolean);
   procedure SetCandyFirstColor(Value:TColor);
   procedure SetCandySecondColor(Value:TColor);
   procedure SetCandyDirection(Value:TCandyDirection);
   procedure SetPen(Value:Boolean);
   public
   procedure Assign(Other: TPersistent);override;
   published
   property CandyEffect:Boolean read FCandyEffect write SetCandyEffect default false;
   property FirstColor:Tcolor read FCandyFisrtColor write SetCandyFirstColor ;
   property SecondColor:Tcolor read FCandySecondColor write SetCandySecondColor ;
   property CandyDirection:TCandyDirection read FCandyDirection write SetCandyDirection;
   property Pen:Boolean read FPen write SetPen default false;
   property OnChange: TNotifyEvent read FOnChange write FOnChange;
   end;

    type
    TProgressText=class(TPersistent)
    Private
    FTextAlignemnt:TTextAlignemnt;
    FMidTextColor:TColor;
    FStartTextColor:TColor;
    FTextBox:Boolean;
    FTextBoxColor:TColor;
    FTextSize:Integer;
    FOnChange: TNotifyEvent;
    protected
    procedure SetTextAlignemnt(Value:TTextAlignemnt);
    procedure SetMidTextColor(Value:Tcolor);
    procedure SetStartTextColor(Value:Tcolor);
    procedure SetTextBox(Value:Boolean);
    procedure SetTextBoxColor(Value:TColor);
    procedure SetTextSize(Value:Integer);
    public
    procedure Assign(Other: TPersistent);override;
    published
    property TextAlignemnt:TTextAlignemnt read FTextAlignemnt write SetTextAlignemnt default txCenter;
    property MidTextColor:TColor read FMidTextColor write SetMidTextColor default clWhite;
    property StartTextColor:Tcolor read FStartTextColor write SetStartTextColor default clBlack;
    property TextBox:Boolean read FTextBox write SetTextBox default false;
    property TextBoxColor:TColor read FTextBoxColor write SetTextBoxColor default clWhite;
    property TextSize:Integer read FTextSize write SetTextSize default 8;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;

    end;



    type
    TGradiantColors=class(TPersistent)
    Private
    FStartColor:TColor;
    FEndColor:TColor;
    FGradientDirection:TGradientDirection;
    FOnChange: TNotifyEvent;
    FGlowEffect:Boolean;
    protected
    procedure SetStartColor(Value:TColor);
    procedure SetEndColor(Value:TColor);
    procedure SetGradientDirection(Value:TGradientDirection);
    procedure SetGlowEffect(Value:Boolean);
    public
    procedure Assign(Other: TPersistent);override;
    published
    property StartColor:TColor read FStartColor write SetStartColor default $000055FF;
    property EndColor:TColor read FEndColor write SetEndColor default clWhite;
    property GradientDirection:TGradientDirection read FGradientDirection write SetGradientDirection default gdVertical;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property GlowEffect:Boolean read FGlowEffect write SetGlowEffect default False; 

    end;


  type
    TBlocKRecord=class(TPersistent)
    Private
    FBlockWidth:Integer;
    FBlockSepration:Integer;
    FBlockStyle: TBlockStyle;
    FOnChange: TNotifyEvent;
    FRoundCorner:Integer;
    FProgressFillSyle:TProgressFillSyle;

    protected
    procedure SetBlockWidth(Value:Integer);
    procedure SetBlockSepration(Value:Integer);
    procedure SetBlockRoundCorner(Value:Integer);
    procedure SetBlockStyle(Value:TBlockStyle);
    procedure SetProgressFillSyle(Value:TProgressFillSyle);


    public
   
  
    procedure Assign(Other: TPersistent);override;

    published
    property BlockWidth:Integer read FBlockWidth  write SetBlockWidth;
    property BlockSepration:Integer read FBlockSepration  write SetBlockSepration;
    property BlockStyle:TBlockStyle read FBlockStyle  write SetBlockStyle default BBsRound;
    property BlockCorner:Integer read FRoundCorner  write SetBlockRoundCorner;
    property ProgressFillSyle:TProgressFillSyle read FProgressFillSyle write SetProgressFillSyle default PFSolidFill;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;


    end;

  type

  TIssamProgressBar=class(TGraphicControl)

   private
   FMin:Integer;
   FMax :Integer;
   Fstep:Integer;
   FBlocksWidth:Integer;
   FFillColor:TColor;
   FBackGroundColor:TColor;
   FLineColor:TColor;
   FBordersColor:TColor;
   FProgress:Integer;
   FProgressSepration:Integer;
   FHasBorders:Boolean;
   FShowProgressPercentage:Boolean;
   FProgressRect:Boolean;
   FSmooth:Boolean;
   FProgressRectPen:TPen;
   FProgressText:TProgressText;
   FBlocks:TBlocKRecord;
   FBvOuter:TBevelOuter;
   FBorderStyle:TMBorderStyle;
   FGradiantColors:TGradiantColors;
   FAOwner:TWinControl;
   FOnProgress:TOnProgressEvent;
   FOnMouseLeave: TNotifyEvent;
   FGlowAffect:Boolean;
   FGlowCount:Integer;
   FCandyEffrect:TCandyEffect;                      //Works Only With Soomth.. & Solid filling..
   FInvalidateCount:Integer;
   FProgressShape:TProgressShape;
   FTransparent:Boolean;
   FSectionsColors:TSectionsColors;
   FBordersEdge:Integer;
   FOnchange:TNotifyEvent;
   procedure RepaintRequest (Sender: TObject)  ;
   procedure SetMin(Value:Integer) ;
   procedure SetMax(Value:Integer) ;
   procedure SetStep(Value:Integer) ;
   procedure SetProgressSepration(Value:Integer) ;
   procedure SetProgress(Value:Integer) ;
   procedure SetFillColor(Value:Tcolor) ;
   procedure SetBackGroundColor(Value:Tcolor) ;
   procedure SetLineColor(Value:Tcolor) ;
   procedure SetBordersColor(Value:Tcolor) ;
   procedure SetHasBorders(Value:Boolean) ;
   procedure SetShowPercent(Value:Boolean) ;
   procedure SetProgressRect(Value:Boolean) ;
   procedure SetSmooth(Value:Boolean);
   procedure SetProgressRectPen(Value:TPen) ;
   procedure SetBlocks(Value:TBlocKRecord);
   procedure SetBvOuter(Value:TBevelOuter);
   procedure SetBorderStyle(Value:TMBorderStyle);
   procedure SetGradiantColors(Value:TGradiantColors);
   procedure SetProgressText(Value:TProgressText);
   procedure SetCandyEffect(Value:TCandyEffect);
   procedure SetProgressShape(Value:TProgressShape);
   procedure SetSectionsColors(Value: TSectionsColors);
   procedure SetBorderEdge(Value:Integer);
   procedure SetTranparent(Value:Boolean);
   procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;

   public
   constructor Create(AOwner:TComponent);override;
   destructor Destroy ;override;
   procedure SetBounds(Aleft,ATop,AWidth,AHeight:Integer);override;

   protected

   procedure Paint ;override;
   function  AssignRect(SRect:Trect):TRect;
   procedure OnProgressHandler(Sender:TObject;const AProgress: Integer);
   Procedure LightEffect (var Btm:tbitmap;Amount:integer);
   function  sinpixs(a: integer): integer;
   function DrawRadiusLines(btmap: TBitmap; Center: TPoint; Radius1,Radius2,
   Max,Progress: Integer;BackGroundColor,StartColor,EndColor:Tcolor): Boolean;

   published
   
   property   Min:Integer read FMin write SetMin;
   property   Max:Integer read FMax write SetMax;
   property   Step:Integer read Fstep write SetStep;
   property   ProgressSepration:Integer read FprogressSepration write SetProgressSepration default 2;
   property   Progress:Integer read FProgress write SetProgress;
   property   ProgressColor:TColor read FFillColor write SetFillColor;
   property   BackGroundColor:TColor read FBackGroundColor write SetBackGroundColor default clWhite;
   property   LineColor:TColor read FLineColor write SetLineColor;
   property   BordersColor:TColor read FBordersColor write SetBordersColor;
   property   HasBorders:Boolean read FHasBorders write SetHasBorders default False;
   property   ShowPercent:Boolean read FShowProgressPercentage write SetShowPercent default False;
   property   ProgressRect:Boolean read FProgressRect write SetProgressRect default False;
   property   ProgressRectPen:TPen read FProgressRectPen write SetProgressRectPen;
   property   Smooth:Boolean read FSmooth write SetSmooth default True;
   property   ProgressBlocks:TBlocKRecord read FBlocks write SetBlocks ;
   property   BevelOuter:TBevelOuter read FBvOuter write SetBvOuter ;
   property   BorderStyle:TMBorderStyle read FBorderStyle write SetBorderStyle;
   property   GradiantColors:TGradiantColors read FGradiantColors write SetGradiantColors;
   property   PercentText:TProgressText read FProgressText write SetProgressText; 
   property   OnProgress:TOnProgressEvent read FOnProgress write FOnProgress ;
   property   OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
   property   CandyEffect:TCandyEffect read FCandyEffrect write SetCandyEffect ; // This Works in case of smooth only
   property   Shape:TProgressShape Read FProgressShape write SetProgressShape default psRecangle;
   property   SectionsColors:TSectionsColors read FSectionsColors write SetSectionsColors;
   property   BorderEdge:Integer read FBordersEdge write SetBorderEdge;
   property   Transparent:Boolean read FTransparent write SetTranparent default False;
   property   Onchange:TNotifyEvent read FOnchange write FOnchange;
   property   Align;
   property   OnMouseMove;
   property   OnClick;
   property   OnDblClick;
  end;






procedure Register ;


implementation

uses Types;



procedure Register;
begin
RegisterComponents('Additional', [TIssamProgressBar]);
end;

function GradientFill(DC: HDC; Vertex: PTriVertex; NumVertex: ULONG;
  Mesh: Pointer; NumMesh, Mode: ULONG): BOOL; stdcall; overload;
  external msimg32 name 'GradientFill';

  function GradientFill(DC: HDC; const ARect: TRect; StartColor,
  EndColor: TColor; Vertical: Boolean): Boolean; overload;
const
  Modes: array[Boolean] of ULONG = (GRADIENT_FILL_RECT_H, GRADIENT_FILL_RECT_V);
var
  Vertices: array[0..1] of TTriVertex;
  GRect: TGradientRect;
begin
  Vertices[0].X := ARect.Left;
  Vertices[0].Y := ARect.Top;
  Vertices[0].Red := GetRValue(ColorToRGB(StartColor)) shl 8;
  Vertices[0].Green := GetGValue(ColorToRGB(StartColor)) shl 8;
  Vertices[0].Blue := GetBValue(ColorToRGB(StartColor)) shl 8;
  Vertices[0].Alpha := 0;
  Vertices[1].X := ARect.Right;
  Vertices[1].Y := ARect.Bottom;
  Vertices[1].Red := GetRValue(ColorToRGB(EndColor)) shl 8;
  Vertices[1].Green := GetGValue(ColorToRGB(EndColor)) shl 8;
  Vertices[1].Blue := GetBValue(ColorToRGB(EndColor)) shl 8;
  Vertices[1].Alpha := 0;
  GRect.UpperLeft := 0;
  GRect.LowerRight := 1;
  Result := GradientFill(DC, @Vertices, 2, @GRect, 1, Modes[Vertical]);
end;




{ TIssamProgressBar }

constructor TIssamProgressBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if  AOwner is TWinControl then
  FAOwner:=AOwner as TWinControl ;
  FMax:=100;
  FMin:=0;
  Fstep:=1;
  FProgress:=0;
  FBlocksWidth:=20;
  FFillColor:=clLime;
  FBackGroundColor:=clWhite;
  FBordersColor:=clWhite;
  FSmooth:=True;
  FInvalidateCount:=0;
  FBordersEdge:=10;
  FProgressSepration:=0; // the default value to make the smooth working...


  Height:=20;
  Width:=150;

  FProgressText:=TProgressText.Create;
  With FProgressText do
  begin
  OnChange:=RepaintRequest;
  FTextBoxColor:=clWhite;
  FMidTextColor:=clWhite;
  FStartTextColor:=clBlue;
  FTextAlignemnt:=txCenter;
  FTextSize:=8;
  end;


  FProgressRectPen:=TPen.Create;

  with FProgressRectPen do
  begin
  OnChange:=RepaintRequest;
  Color:=clWhite;
  end;

  
  FCandyEffrect:=TCandyEffect.Create;
  with FCandyEffrect do
  begin
  OnChange:=RepaintRequest;
  FirstColor:=clRed;
  SecondColor:=clYellow;
  CandyDirection:=cdLeft;
  end;


 FBlocks:=TBlocKRecord.Create;
 with FBlocks do
 begin
 OnChange:=RepaintRequest;
 BlockWidth:=20;
 BlockSepration:=2;
 BlockStyle:=BBsRectangle;
 end;


 FGradiantColors:=TGradiantColors.Create;
 with FGradiantColors do
 begin
 OnChange:=RepaintRequest;
 FStartColor:=$000055FF;
 FEndColor:=clWhite;

 end;



 FSectionsColors:=TSectionsColors.Create(Self);
 FSectionsColors.OnChange:=RepaintRequest;

end;

destructor TIssamProgressBar.Destroy;
begin
  FProgressRectPen.Free;
  FBlocks.Free;
  FSectionsColors.Free;
  FProgressText.Free;
  FGradiantColors.Free;
  inherited Destroy;
end;



procedure TIssamProgressBar.Paint;
var
  FillRecta,ClRect,TempRect,Temp2Rect:TRect;
  Blocks,Sections:array of TRect;
  BlockCount,PercentRectLeft,PercentRectTop:Integer;
  PercentWidth,PercentHeight,NewPerLeft,NewPerTop:Integer;
  Bhr,Rhrgn,Hhrgn,PerHrgn:HRGN;
  TempBmp:TBitmap;
  Triangle:array[0..1]of TTriangle;
  Fourangle:TFourangle;
  Chrgn1,Chrgn2,Chrgn3:HRGN; // Candy Effect;
  //=========
  Rad:Integer;
  BlockAngle:Extended;
  BlockStep,SectionWidth,SectionCount,SecIndex:integer ;
  BlockCenters:array of TPoint;
  i:Integer;
  StepRect:TRect;
  Hr1,Hr2:HRGN;
begin
inherited;

SecIndex:=0;

if FInvalidateCount<High(Integer) then
FInvalidateCount:=FInvalidateCount+1 else FInvalidateCount:=0;


Canvas.Font.Size:=FProgressText.FTextSize;

case FProgressShape of

psRecangle :
           begin



 with FillRecta do
                 begin
                 Left:=0;
                 Top:=FProgressSepration;
                 Right:=Round(FProgress*ClientWidth/Fmax);
                 Bottom:=ClientRect.Bottom-FProgressSepration;
                 end;

 with ClRect     do
                 begin
                 Left:=ClientRect.Left;
                 Top:=ClientRect.Top;
                 Right:=ClientRect.Right;
                 Bottom:=ClientRect.Bottom;
                 end;



case FBorderStyle of

BsRound , BsRectagle:  begin
                       if Not FTransparent then
                       begin
                       Canvas.Brush.Style:=bsSolid;
                       Canvas.Brush.Color:=FBackGroundColor;
                       Canvas.FillRect(ClientRect);
                       end;
                       end;

end;



//Draw Progress..



if not FSmooth then                    //if Blocks style...
begin
SetLength(Blocks,Round(ClientWidth/FBlocks.fBlockWidth)+1) ;
for BlockCount:=0 to  Round(ClientWidth/FBlocks.fBlockWidth)  do
begin
Blocks[BlockCount].Left:=BlockCount*FBlocks.FBlockWidth ;
Blocks[BlockCount].top:=FProgressSepration;
Blocks[BlockCount].Right:=Blocks[BlockCount].Left+FBlocks.fBlockWidth;
Blocks[BlockCount].Bottom:=ClientHeight-FProgressSepration-1;

// Determine the Blocks that gona be filled ..


Canvas.Brush.Style:=bsSolid;
Canvas.Brush.Color:=FFillColor;

TempRect.Left:=Blocks[BlockCount].Left;
TempRect.top:=Blocks[BlockCount].Top;
TempRect.Bottom:=Blocks[BlockCount].Bottom;

if  (Round(FProgress*ClientWidth/Fmax))>=Blocks[BlockCount].Right then
begin
TempRect.Right:=Blocks[BlockCount].Right-FBlocks.fBlockSepration ;

case FBlocks.FBlockStyle of
BBsRectangle:begin

             case FBlocks.FProgressFillSyle of

             PFSolidFill :Canvas.FillRect(TempRect);

             PFGradientFill:begin
                            case FGradiantColors.FGradientDirection of
                            gdVertical: GradientFill(Canvas.Handle, TempRect, FGradiantColors.FStartColor , FGradiantColors.FEndColor, true);    //
                            gdHorizontal:   begin
                                            TempBmp:=TBitmap.Create;
                                            TempBmp.Width:=FillRecta.Right-FillRecta.Left;
                                            TempBmp.Height:=FillRecta.Bottom-fillRecta.Top;
                                            GradientFill(TempBmp.Canvas.Handle,TempBmp.Canvas.ClipRect, FGradiantColors.FStartColor , FGradiantColors.FEndColor, False);
                                            Canvas.CopyRect(TempRect,TempBmp.Canvas,TempRect);
                                            TempBmp.Free;
                                            end;
                            gdMidHorizontal:begin
                                            Temp2Rect:=AssignRect(TempRect);
                                            SetRect(TempRect,TempRect.Left,TempRect.Top,TempRect.Right,(TempRect.Bottom-TempRect.Top)div 2);
                                            GradientFill(Canvas.Handle,TempRect,FGradiantColors.FEndColor,FGradiantColors.FStartColor,TRue) ;
                                            SetRect(Temp2Rect,Temp2Rect.Left,(Temp2Rect.Bottom- Temp2Rect.Top)div 2 ,Temp2Rect.Right,Temp2Rect.Bottom);
                                            GradientFill(Canvas.Handle,Temp2Rect,FGradiantColors.FStartColor,FGradiantColors.FEndColor,TRue)
                                            end;

                            gdMidVertical  :begin
                                            //======================= After..

                                            end;
                            end;

                            end;

             PfSections :   begin
                            SectionWidth:=Round(ClientWidth/(FSectionsColors.Count-1));
                           if (TempRect.Right/SectionWidth)<=1 then SecIndex:=0 else SecIndex:=Round(Roundto(TempRect.Right/SectionWidth,0));
                                            Temp2Rect:=AssignRect(TempRect);
                                            SetRect(TempRect,TempRect.Left,TempRect.Top,TempRect.Right,(TempRect.Bottom-TempRect.Top)div 2);
                                            GradientFill(Canvas.Handle,TempRect,clWhite,FSectionsColors.Items[SecIndex].Fcolor,TRue) ;
                                            SetRect(Temp2Rect,Temp2Rect.Left,(Temp2Rect.Bottom- Temp2Rect.Top)div 2 ,Temp2Rect.Right,Temp2Rect.Bottom);
                                            GradientFill(Canvas.Handle,Temp2Rect,FSectionsColors.Items[SecIndex].Fcolor,clWhite,TRue) ;
                           // Canvas.FillRect(TempRect);

                            end;


                            end;

             end;

            


BBsRound:begin
         Bhr:=CreateRoundRectRgn(TempRect.Left,TempRect.Top,TempRect.Right,TempRect.Bottom,FBlocks.FRoundCorner,FBlocks.FRoundCorner) ;
         FillRgn(Canvas.Handle,Bhr,Canvas.Brush.Handle) ;
         DeleteObject(Bhr) ;
         end;

BBsCircle:begin
          Bhr:=CreateEllipticRgnIndirect(TempRect);
          case FBlocks.FProgressFillSyle of
          PFSolidFill :FillRgn(Canvas.Handle,Bhr,Canvas.Brush.Handle) ;

          PFGradientFill:begin
                        case FGradiantColors.FGradientDirection of
                                                                  gdHorizontal:   begin
                                                                                  TempBmp:=TBitmap.Create;
                                                                                  TempBmp.Width:=FillRecta.Right-FillRecta.Left;
                                                                                  TempBmp.Height:=FillRecta.Bottom-fillRecta.Top;
                                                                                  GradientFill(TempBmp.Canvas.Handle,TempBmp.Canvas.ClipRect, FGradiantColors.FStartColor , FGradiantColors.FEndColor, False);

                                                                                  Rhrgn:=CreateEllipticRgnIndirect(FillRecta);   //TempBmp.Canvas.ClipRect
                                                                                  Hhrgn:=CreateRectRgn(FillRecta.Left,FillRecta.top,FillRecta.Right,FillRecta.Bottom);
                                                                                  CombineRgn(Hhrgn,Rhrgn,Hhrgn,RGN_XOR	) ;;
                                                                                  Canvas.Brush.Style:=bsClear;
                                                                                  Canvas.Brush.Color:=FBackGroundColor;
                                                                                  FillRgn(TempBmp.Canvas.Handle,Hhrgn,TempBmp.Canvas.Brush.Handle) ;
                                                                                  Canvas.CopyRect(TempRect,TempBmp.Canvas,TempRect);
                                                                                  DeleteObject(Rhrgn)  ;
                                                                                  DeleteObject(Hhrgn)   ;




                                                                                  TempBmp.Free;
                                                                                  end;

                        end;


                        end;
          end;
          DeleteObject(Bhr) ;
          end;
end;
end
else                            // To handle the remaing progress that is bigger than Block width ...
begin
TempRect.Right:=Round(FProgress*ClientWidth/Fmax);
case FBlocks.FBlockStyle of
BBsRectangle: begin
              case FBlocks.FProgressFillSyle of
              PFSolidFill   : begin
                              Canvas.FillRect(TempRect);
                              Break;
                              end;
              PFGradientFill: begin
                              case FGradiantColors.FGradientDirection of
                                   gdVertical: GradientFill(Canvas.Handle, TempRect, FGradiantColors.FStartColor , FGradiantColors.FEndColor, true);    //
                                   gdHorizontal:  begin
                                                  TempBmp:=TBitmap.Create;
                                                  TempBmp.Width:=FillRecta.Right-FillRecta.Left;
                                                  TempBmp.Height:=FillRecta.Bottom-fillRecta.Top;
                                                  GradientFill(TempBmp.Canvas.Handle,TempBmp.Canvas.ClipRect, FGradiantColors.FStartColor , FGradiantColors.FEndColor, False);
                                                  Canvas.CopyRect(TempRect,TempBmp.Canvas,TempRect);
                                                  TempBmp.Free;
                                                  end;
                                  gdMidHorizontal:begin
                                                  Temp2Rect:=AssignRect(TempRect);
                                                  SetRect(TempRect,TempRect.Left,TempRect.Top,TempRect.Right,(TempRect.Bottom-TempRect.Top)div 2);
                                                  GradientFill(Canvas.Handle,TempRect,FGradiantColors.FEndColor,FGradiantColors.FStartColor,TRue) ;
                                                  SetRect(Temp2Rect,Temp2Rect.Left,(Temp2Rect.Bottom- Temp2Rect.Top)div 2 ,Temp2Rect.Right,Temp2Rect.Bottom);
                                                  GradientFill(Canvas.Handle,Temp2Rect,FGradiantColors.FStartColor,FGradiantColors.FEndColor,TRue)
                                                  end;

                                  gdMidVertical  :begin


                                                  end;
                              end;
                              Break;
                              end;
              PfSections :    begin
                              SectionWidth:=Round(ClientWidth/(FSectionsColors.Count-1));
                               if (TempRect.Right/SectionWidth)<=1 then SecIndex:=0 else SecIndex:=Round(Roundto(TempRect.Right/SectionWidth,0));
                               Temp2Rect:=AssignRect(TempRect);
                               SetRect(TempRect,TempRect.Left,TempRect.Top,TempRect.Right,(TempRect.Bottom-TempRect.Top)div 2);
                               GradientFill(Canvas.Handle,TempRect,clWhite,FSectionsColors.Items[SecIndex].Fcolor,TRue) ;
                               SetRect(Temp2Rect,Temp2Rect.Left,(Temp2Rect.Bottom- Temp2Rect.Top)div 2 ,Temp2Rect.Right,Temp2Rect.Bottom);
                               GradientFill(Canvas.Handle,Temp2Rect,FSectionsColors.Items[SecIndex].Fcolor,clWhite,TRue) ;
                               Break;
                              end;


              end;
              end;
BBsRound:     begin
              Bhr:=CreateRoundRectRgn(TempRect.Left,TempRect.Top,TempRect.Right,TempRect.Bottom,FBlocks.FRoundCorner,FBlocks.FRoundCorner) ;
              FillRgn(Canvas.Handle,Bhr,Canvas.Brush.Handle) ;
              DeleteObject(Bhr) ;
              Break;
              end;
BBsCircle:    begin
              Bhr:=CreateEllipticRgnIndirect(TempRect);
              FillRgn(Canvas.Handle,Bhr,Canvas.Brush.Handle) ;
              DeleteObject(Bhr) ;
              Break;
              end;

end;
end;

end;

end else                         // if Smooth then..
begin
     case FBlocks.FProgressFillSyle of

     PFSolidFill   :begin
                    if not FCandyEffrect.FCandyEffect then
                    begin
                    canvas.Brush.Style:=bsSolid;
                    Canvas.Brush.Color:=FFillColor;
                    Canvas.FillRect(FillRecta);
                    end else                                // Candy Effect
                    begin

                    if FProgressRectPen<>nil then                  //For the borders only...
                    Canvas.Pen.Assign(FProgressRectPen);

                    SetLength(Blocks,Round(ClientWidth/FBlocks.fBlockWidth)+1) ;
                    for BlockCount:=0 to  Round(ClientWidth/FBlocks.fBlockWidth)  do
                    begin

                    with Blocks[BlockCount] do
                    begin
                    Left:=BlockCount*FBlocks.FBlockWidth ;
                    top:=FProgressSepration;
                    Right:=Blocks[BlockCount].Left+FBlocks.fBlockWidth;
                    Bottom:=ClientHeight-FProgressSepration;
                    end;

                    TempRect.Left:=Blocks[BlockCount].Left;
                    TempRect.top:=Blocks[BlockCount].Top;
                    TempRect.Bottom:=Blocks[BlockCount].Bottom;

                    if  (Round(FProgress*ClientWidth/Fmax))>=Blocks[BlockCount].Right then
                    begin
                    TempRect.Right:=Blocks[BlockCount].Right ;
                    Canvas.Brush.Style:=bsSolid;

                    if Odd(FInvalidateCount) and (FGradiantColors.FGlowEffect) then                //Glow effect..
                    Canvas.Brush.Color:=FCandyEffrect.FCandyFisrtColor else Canvas.Brush.Color:=FCandyEffrect.FCandySecondColor;


                    case FCandyEffrect.FCandyDirection  of
                    cdLeft :
                    begin
                    Triangle[0,0]:=Point(TempRect.Left,TempRect.Top);
                    Triangle[0,1]:=Point(TempRect.Left+((TempRect.Right-TempRect.Left) div 2),TempRect.Bottom) ;
                    Triangle[0,2]:=Point(TempRect.Left,TempRect.Bottom);
                    end;

                    cdRight :
                    begin
                    Triangle[0,0]:=Point(TempRect.Left,TempRect.Top);
                    Triangle[0,1]:=Point(TempRect.Left+((TempRect.Right-TempRect.Left) div 2),TempRect.Top);
                    Triangle[0,2]:=Point(TempRect.Left,TempRect.Bottom);
                    end;

                    end;

                    Chrgn1:=CreatePolygonRgn(Triangle[0],3,WINDING);
                    FillRgn(Canvas.Handle,Chrgn1,Canvas.Brush.Handle);
                    if FCandyEffrect.FPen then   Canvas.Polyline(Triangle[0]);

                    case FCandyEffrect.FCandyDirection  of
                    cdLeft :
                    begin
                    Triangle[1,0]:=Point(TempRect.Left+((TempRect.Right-TempRect.Left) div 2),TempRect.Top);
                    Triangle[1,1]:=Point(TempRect.Right,TempRect.Top);
                    Triangle[1,2]:=Point(TempRect.Right,TempRect.Bottom);
                    end;

                    cdRight :
                    begin
                    Triangle[1,0]:=Point(TempRect.Right,TempRect.Top);
                    Triangle[1,1]:=Point(TempRect.Right,TempRect.Bottom);
                    Triangle[1,2]:=Point(TempRect.Left+((TempRect.Right-TempRect.Left) div 2),TempRect.Bottom) ;
                    end;


                    end;

                    Chrgn2:=CreatePolygonRgn(Triangle[1],3,WINDING);
                    FillRgn(Canvas.Handle,Chrgn2,Canvas.Brush.Handle);
                    if FCandyEffrect.FPen then   Canvas.Polyline(Triangle[1]);

                    case FCandyEffrect.FCandyDirection  of
                    cdLeft :
                    begin
                    Fourangle[0]:=Point(TempRect.Left,TempRect.Top);
                    Fourangle[1]:=Point(TempRect.Left+((TempRect.Right-TempRect.Left) div 2),TempRect.Top);
                    Fourangle[2]:=Point(TempRect.Right,TempRect.Bottom);
                    Fourangle[3]:=Point(TempRect.Left+((TempRect.Right-TempRect.Left) div 2),TempRect.Bottom);
                    end;

                    cdRight :
                    begin
                    Fourangle[0]:=Point(TempRect.Left,TempRect.Bottom);
                    Fourangle[1]:=Point(TempRect.Left+((TempRect.Right-TempRect.Left) div 2),TempRect.Top);
                    Fourangle[2]:=Point(TempRect.Right,TempRect.Top);
                    Fourangle[3]:=Point(TempRect.Left+((TempRect.Right-TempRect.Left) div 2),TempRect.Bottom);
                    end;



                    end;
                    if Odd(FInvalidateCount) and (FGradiantColors.FGlowEffect) then
                    Canvas.Brush.Color:=FCandyEffrect.FCandySecondColor else Canvas.Brush.Color:=FCandyEffrect.FCandyFisrtColor ;

                    Chrgn3:=CreatePolygonRgn(Fourangle,4,WINDING);
                    FillRgn(Canvas.Handle,Chrgn3,Canvas.Brush.Handle);
                    if FCandyEffrect.FPen then   Canvas.Polyline(Fourangle);

                    end else                                       // The last Block ....
                    begin
                    TempRect.Right:=Round(FProgress*ClientWidth/Fmax);
                    Canvas.Brush.Style:=bsSolid;
                    if Odd(FInvalidateCount) and (FGradiantColors.FGlowEffect) then
                    Canvas.Brush.Color:=FCandyEffrect.FirstColor else Canvas.Brush.Color:=FCandyEffrect.SecondColor;



                    case FCandyEffrect.FCandyDirection  of
                    cdLeft :
                    begin
                    Triangle[0,0]:=Point(TempRect.Left,TempRect.Top);
                    Triangle[0,1]:=Point(TempRect.Left+((TempRect.Right-TempRect.Left) div 2),TempRect.Bottom) ;
                    Triangle[0,2]:=Point(TempRect.Left,TempRect.Bottom);
                    end;

                    cdRight :
                    begin
                    Triangle[0,0]:=Point(TempRect.Left,TempRect.Top);
                    Triangle[0,1]:=Point(TempRect.Left+((TempRect.Right-TempRect.Left) div 2),TempRect.Top);
                    Triangle[0,2]:=Point(TempRect.Left,TempRect.Bottom);
                    end;

                    end;

                    Chrgn1:=CreatePolygonRgn(Triangle[0],3,WINDING);
                    FillRgn(Canvas.Handle,Chrgn1,Canvas.Brush.Handle);
                    if FCandyEffrect.FPen then   Canvas.Polyline(Triangle[0]);

                    case FCandyEffrect.FCandyDirection  of
                    cdLeft :
                    begin
                    Triangle[1,0]:=Point(TempRect.Left+((TempRect.Right-TempRect.Left) div 2),TempRect.Top);
                    Triangle[1,1]:=Point(TempRect.Right,TempRect.Top);
                    Triangle[1,2]:=Point(TempRect.Right,TempRect.Bottom);
                    end;

                    cdRight :
                    begin
                    Triangle[1,0]:=Point(TempRect.Right,TempRect.Top);
                    Triangle[1,1]:=Point(TempRect.Right,TempRect.Bottom);
                    Triangle[1,2]:=Point(TempRect.Left+((TempRect.Right-TempRect.Left) div 2),TempRect.Bottom) ;
                    end;


                    end;

                    Chrgn2:=CreatePolygonRgn(Triangle[1],3,WINDING);
                    FillRgn(Canvas.Handle,Chrgn2,Canvas.Brush.Handle);
                    if FCandyEffrect.FPen then   Canvas.Polyline(Triangle[1]);

                    case FCandyEffrect.FCandyDirection  of
                    cdLeft :
                    begin
                    Fourangle[0]:=Point(TempRect.Left,TempRect.Top);
                    Fourangle[1]:=Point(TempRect.Left+((TempRect.Right-TempRect.Left) div 2),TempRect.Top);
                    Fourangle[2]:=Point(TempRect.Right,TempRect.Bottom);
                    Fourangle[3]:=Point(TempRect.Left+((TempRect.Right-TempRect.Left) div 2),TempRect.Bottom);
                    end;

                    cdRight :
                    begin
                    Fourangle[0]:=Point(TempRect.Left,TempRect.Bottom);
                    Fourangle[1]:=Point(TempRect.Left+((TempRect.Right-TempRect.Left) div 2),TempRect.Top);
                    Fourangle[2]:=Point(TempRect.Right,TempRect.Top);
                    Fourangle[3]:=Point(TempRect.Left+((TempRect.Right-TempRect.Left) div 2),TempRect.Bottom);
                    end;



                    end;
                    if Odd(FInvalidateCount) and (FGradiantColors.FGlowEffect) then
                    Canvas.Brush.Color:=FCandyEffrect.SecondColor else Canvas.Brush.Color:=FCandyEffrect.FirstColor ;

                    Chrgn3:=CreatePolygonRgn(Fourangle,4,WINDING);
                    FillRgn(Canvas.Handle,Chrgn3,Canvas.Brush.Handle);
                    if FCandyEffrect.FPen then   Canvas.Polyline(Fourangle);

                    Break;




                    end;

                    end;
                    if Chrgn1<>0 then
                    DeleteObject(Chrgn1);
                    if Chrgn2<>0 then
                    DeleteObject(Chrgn2);
                    if Chrgn3<>0 then
                    DeleteObject(Chrgn3);

                    end;


                    end;



     PFGradientFill:begin
                    GradientFill(Canvas.Handle, FillRecta, FGradiantColors.FStartColor , FGradiantColors.FEndColor, Boolean(FGradiantColors.FGradientDirection=gdVertical));

                    end;

     PfSections     :begin
                     SectionWidth:=Round(ClientWidth/FSectionsColors.Count);

                     //Set Blocks ...

                     SetLength(Sections,Round(ClientWidth/SectionWidth)+1) ;
                     for SectionCount:=0 to  FSectionsColors.Count-1  do
                     begin

                     with Sections[SectionCount] do
                     begin
                     Left:=SectionCount*SectionWidth ;
                     top:=FProgressSepration;
                     Right:=Sections[SectionCount].Left+SectionWidth;
                     Bottom:=ClientHeight-FProgressSepration;
                     end;

                     with TempRect do
                     begin
                     Left:=Sections[SectionCount].Left;
                     top:=Sections[SectionCount].Top;
                     Bottom:=Sections[SectionCount].Bottom;
                     end;

                     Canvas.Brush.Color:=FSectionsColors.Items[SectionCount].Color;
                     Canvas.Brush.Style:=bsSolid;
                     if  (Round(FProgress*ClientWidth/Fmax))>=Sections[SectionCount].Right then
                     begin
                     TempRect.Right:=Sections[SectionCount].Right-FBlocks.fBlockSepration;
                     Canvas.FillRect(TempRect);

                     if FSectionsColors.Items[SectionCount].FShowText then
                     begin
                     Canvas.Font.Color:=FSectionsColors.Items[SectionCount].TextColor ;
                     Canvas.Brush.Style:=bsClear;
                     Canvas.TextOut(Sections[SectionCount].Left+((Sections[SectionCount].Right-(Sections[SectionCount].Left))div 2)-((Canvas.TextWidth(FSectionsColors.Items[SectionCount].FText))div 2)
                     ,Sections[SectionCount].top+((Sections[SectionCount].Bottom-(Sections[SectionCount].top))div 2)-((Canvas.TextHeight(FSectionsColors.Items[SectionCount].FText))div 2),FSectionsColors.Items[SectionCount].FText)   ;

                     end
                     end else
                     begin                                    // The last Block ....
                     TempRect.Right:=Round(FProgress*ClientWidth/Fmax);
                     Canvas.Brush.Style:=bsSolid;
                     Canvas.FillRect(TempRect);
                     if FSectionsColors.Items[SectionCount].FShowText then
                     begin
                     Canvas.Brush.Style:=bsClear;
                     Canvas.Font.Color:=FSectionsColors.Items[SectionCount].TextColor ;
                     Canvas.TextOut(Sections[SectionCount].Left+((Sections[SectionCount].Right-(Sections[SectionCount].Left))div 2)-((Canvas.TextWidth(FSectionsColors.Items[SectionCount].FText))div 2)
                     ,Sections[SectionCount].top+((Sections[SectionCount].Bottom-(Sections[SectionCount].top))div 2)-((Canvas.TextHeight(FSectionsColors.Items[SectionCount].FText))div 2),FSectionsColors.Items[SectionCount].FText)   ;

                     end;


                     Break;
                     end;




                     end;




                     end;

                    end;


end;



if FProgressRect then       // Draw the Progress border Rectangle ...
begin
if  FProgressSepration<2 then
FProgressSepration:=2;     //the ideal value for the progress sepration must be 2 so the user can see the lines..
Canvas.Pen:=FProgressRectPen;
Canvas.Pen.Width:=1;
Canvas.Brush.Style:=bsClear;
case FBorderStyle of
BsRectagle:
Canvas.Rectangle(FillRecta);
BsRound:
Canvas.RoundRect(FillRecta.Left,FillRecta.Top,FillRecta.Right,FillRecta.Bottom,FBordersEdge,FBordersEdge);
end;
end;

// Draw Borders..

if FHasBorders then
begin
Canvas.Pen.Color:=FBordersColor;
Canvas.Pen.Style:=psSolid;
Canvas.Pen.Width:=1;
Canvas.Brush.Style:=bsClear;
If not (FBorderStyle=BsRound) then
Canvas.Rectangle(ClientRect) else
Canvas.RoundRect(ClientRect.Left,ClientRect.Top,ClientRect.Right-1,ClientRect.Bottom-1,FBordersEdge,FBordersEdge);
end;

//  Show Progress Percentage....

if FShowProgressPercentage then
begin
Canvas.Brush.Style:=bsSolid;
if (100*Roundto((FProgress/FMax),-2))<=50 then
Canvas.Font.Color:=FProgressText.FStartTextColor else Canvas.Font.Color:=FProgressText.FMidTextColor;

if FProgressText.FTextBox then
begin
Canvas.Brush.Color:=FProgressText.FTextBoxColor;
PercentRectLeft:=(ClientWidth div 2)-(Canvas.TextWidth(FloatToStr(100*Roundto((FProgress/FMax),-2))+'%') div 2);
PercentRectTop:=(ClientHeight div 2)-(Canvas.TextHeight(FloatToStr(100*Roundto((FProgress/FMax),-2))+'%') div 2);

PercentWidth:=Canvas.TextWidth(FloatToStr(100*Roundto((FProgress/FMax),-2))+'%');
PercentHeight:=Canvas.TextHeight(FloatToStr(100*Roundto((FProgress/FMax),-2))+'%');

//=========

case  FProgressText.FTextAlignemnt of

      txCenter:begin
               NewPerLeft:=PercentRectLeft-1;
               NewPerTop:=PercentRectTop;
               PerHrgn:=CreateRoundRectRgn(NewPerLeft,NewPerTop,PercentRectLeft+PercentWidth+2,PercentRectTop+PercentHeight+2,5,5)  ;
               end;
      txLeft  :begin
               NewPerLeft:=1;
               NewPerTop:=PercentRectTop;
               PerHrgn:=CreateRoundRectRgn(NewPerLeft,NewPerTop,PercentWidth+2,PercentRectTop+PercentHeight+2,5,5)  ;
               end;
      txRight :begin
               NewPerLeft:=ClientWidth-PercentWidth-2;
               NewPerTop:=(ClientHeight div 2)-(PercentHeight div 2)-1;
               PerHrgn:=CreateRoundRectRgn(NewPerLeft,NewPerTop,ClientWidth-1,(ClientHeight div 2)-(PercentHeight div 2)+1+PercentHeight,5,5)  ;
               End;

end;

FillRgn(Canvas.Handle,PerHrgn,Canvas.Brush.Handle) ;

DeleteObject(PerHrgn);

Canvas.Brush.Style:=bsClear;
Canvas.TextOut(NewPerLeft,NewPerTop,FloatToStr(100*Roundto((FProgress/FMax),-2))+'%');

//=========


end
else            // No Text Box ...
begin

PercentRectLeft:=(ClientWidth div 2)-(Canvas.TextWidth(FloatToStr(100*Roundto((FProgress/FMax),-2))+'%') div 2);
PercentRectTop:=(ClientHeight div 2)-(Canvas.TextHeight(FloatToStr(100*Roundto((FProgress/FMax),-2))+'%') div 2);

PercentWidth:=Canvas.TextWidth(FloatToStr(100*Roundto((FProgress/FMax),-2))+'%');
PercentHeight:=Canvas.TextHeight(FloatToStr(100*Roundto((FProgress/FMax),-2))+'%');

case  FProgressText.FTextAlignemnt of

      txCenter:begin
               NewPerLeft:=PercentRectLeft-1;
               NewPerTop:=PercentRectTop;
               end;
      txLeft  :begin
               NewPerLeft:=1;
               NewPerTop:=PercentRectTop;
               end;
      txRight :begin
               NewPerLeft:=ClientWidth-PercentWidth-2;
               NewPerTop:=(ClientHeight div 2)-(PercentHeight div 2)-1;
               End;

end;


Canvas.Brush.Style:=bsClear;
Canvas.TextOut(NewPerLeft,NewPerTop,FloatToStr(100*Roundto((FProgress/FMax),-2))+'%');
//Canvas.TextOut((ClientWidth div 2)-(Canvas.TextWidth(FloatToStr(100*Roundto((FProgress/FMax),-2))+'%')div 2),(ClientHeight div 2)-(Canvas.TextHeight(FloatToStr(100*Roundto((FProgress/FMax),-2))+'%')div 2),FloatToStr(100*Roundto((FProgress/FMax),-2))+'%');
end;
end;


//Draw Bevels
if not FHasBorders then
case FBvOuter of
bvRaised : begin

           with Canvas do
           begin
           Pen.Width:=1;
           Pen.Style:=psSolid;
           MoveTo(0,0);
           Pen.Color:=clWhite;
           LineTo(ClientWidth,0);
           MoveTo(0,0);
           LineTo(0,ClientHeight);
           MoveTo(0,ClientHeight-1);
           Pen.Color:=clMedGray;
           LineTo(ClientWidth-1,ClientHeight-1);
           MoveTo(ClientWidth-1,ClientHeight-1);
           LineTo(ClientWidth-1,0);
           end;

           end;
bvLowred : begin
           if FBorderStyle<>bsRound then               //Could not achive lowred in this case..
           with Canvas do
           begin
           Pen.Width:=1;
           Pen.Style:=psSolid;
           MoveTo(0,0);
           Pen.Color:=clMedGray;
           LineTo(ClientWidth,0);
           MoveTo(0,0);
           LineTo(0,ClientHeight);
           MoveTo(0,ClientHeight-1);
           Pen.Color:=clWhite;
           LineTo(ClientWidth-1,ClientHeight-1);
           MoveTo(ClientWidth-1,ClientHeight-1);
           LineTo(ClientWidth-1,0);
           end;

           end;

end;

end;

psCircle:
         begin
         Width:=150;
         Height:=150;
         TempBmp:=TBitmap.Create;
         TempBmp.Width:=Width;
         TempBmp.Height:=Height;

         if Odd(FInvalidateCount) and (FGradiantColors.FGlowEffect) then
         GradientFill(TempBmp.Canvas.Handle,TempBmp.Canvas.ClipRect,FGradiantColors.FStartColor,FGradiantColors.EndColor,False)else
         GradientFill(TempBmp.Canvas.Handle,TempBmp.Canvas.ClipRect,FGradiantColors.FStartColor,FGradiantColors.EndColor,true) ;

         Rad:=50;        //DEfault value;
         BlockCount:=20 ;   //Deafsult Value..
         BlockAngle:=2*PI/BlockCount  ;
         BlockStep:=Round((Rad*Cos(BlockAngle)-Rad*cos(2*BlockAngle)));
         SetLength(BlockCenters,BlockCount+1);
         for i:=0 to BlockCount-1 do
         begin
         with BlockCenters[i] do
         begin

         x:=Round(Rad*cos(i*BlockAngle))+75;  //75 is the mid width & Height...
         y:=Round(Rad*sin(i*BlockAngle))+75;

         with StepRect do
         begin
         Left:=x-BlockStep;
         Top:=y-BlockStep;
         Right:=x+BlockStep;
         Bottom:=y+BlockStep;
         end;

    //     Canvas.Ellipse(StepRect);
         hr1:=CreateEllipticRgnIndirect(StepRect);
         hr2:=CreateRectRgnIndirect(StepRect)  ;
         if (i*BlockAngle)<=((FProgress+1)*2*PI/FMax) then
         begin
         Canvas.CopyRect(StepRect,TempBmp.Canvas,StepRect);
         CombineRgn(hr1,hr2,hr1,RGN_XOR	) ;
         
         if  FAOwner is TWinControl then
         Canvas.Brush.Color:=(FAOwner as TWinControl).Brush.Color; // the background... Transparent..

         FillRgn(Canvas.Handle,Hr1,Canvas.Brush.Handle);
         end;
         Canvas.Font.Size:=20;
         Canvas.TextOut((ClientWidth div 2)-(Canvas.TextWidth(FloatToStr(100*Roundto((FProgress/FMax),-2))+'%') div 2),(ClientHeight div 2)-(Canvas.TextHeight(FloatToStr(100*Roundto((FProgress/FMax),-2))+'%') div 2),FloatToStr(100*Roundto((FProgress/FMax),-2))+'%');


         DeleteObject(hr1);
         DeleteObject(hr2);




         end;



         end;
         TempBmp.Free;

         end;

psSectors :begin
         Width:=150;
         Height:=150;
         TempBmp:=TBitmap.Create;
         TempBmp.Width:=Width;
         TempBmp.Height:=Height;
         if not FTransparent then
         DrawRadiusLines(TempBmp,Point(Width div 2,Height div 2),(Width div 2)-2,20,FMax,FProgress,FBackGroundColor,FGradiantColors.FStartColor,FGradiantColors.EndColor)else
         DrawRadiusLines(TempBmp,Point(Width div 2,Height div 2),(Width div 2)-2,20,FMax,FProgress,FAOwner.Brush.Color,FGradiantColors.FStartColor,FGradiantColors.EndColor) ;
         Canvas.CopyRect(Rect(0,0,150,150),TempBmp.Canvas,Rect(0,0,150,150));
         TempBmp.Free;






           end;         



end;

case FBorderStyle of
BsRound :begin
          Rhrgn:=CreateRoundRectRgn(0,0,ClientWidth,ClientHeight,FBordersEdge,FBordersEdge);
          Hhrgn:=CreateRectRgn(ClientRect.Left,ClientRect.Top,ClientRect.Right,ClientRect.Bottom);
          CombineRgn(Hhrgn,Rhrgn,Hhrgn,RGN_XOR	) ;
          Canvas.Brush.Style:=bsClear;
          Canvas.Brush.Color:=FAOwner.Brush.Color;
          FillRgn(Canvas.Handle,Hhrgn,Canvas.Brush.Handle) ;
          DeleteObject(Rhrgn)  ;
          DeleteObject(Hhrgn)   ;
          end;

         end;
end;






procedure TIssamProgressBar.RepaintRequest;
begin
Invalidate;
end;

procedure TIssamProgressBar.SetBackGroundColor(Value: Tcolor);
begin
if Value<>FBackGroundColor then
begin
FBackGroundColor:=Value;
Invalidate;
end;
end;

procedure TIssamProgressBar.SetBlocks(Value: TBlocKRecord);
begin
FBlocks.Assign(Value);
Invalidate;
end;

procedure TIssamProgressBar.SetBordersColor(Value: Tcolor);
begin

if Value<>FBordersColor then
begin
FBordersColor:=Value;
Invalidate;
end;

end;

procedure TIssamProgressBar.SetBorderStyle(Value: TMBorderStyle);
begin
if Value<>FBorderStyle then
begin
FBorderStyle:=Value;
Invalidate;
end;

end;

procedure TIssamProgressBar.SetBvOuter(Value: TBevelOuter);
begin
if Value<>FBvOuter then
begin
FBvOuter:=Value   ;
Invalidate;
end;
end;

procedure TIssamProgressBar.SetFillColor(Value: Tcolor);
begin
if Value<>FFillColor then
begin
FFillColor:=Value;
Invalidate;
end;
end;

procedure TIssamProgressBar.SetHasBorders(Value: Boolean);
begin
    if Value<>FHasBorders then
begin
FHasBorders:=Value;
Invalidate;
end;

end;

procedure TIssamProgressBar.SetLineColor(Value: Tcolor);
begin
  if Value<>FLineColor then
begin
FLineColor:=Value;
Invalidate;
end;

end;

procedure TIssamProgressBar.SetMax(Value: Integer);
begin
  if Value<>FMax then
begin
FMax:=Value;
Invalidate;
end;

end;



procedure TIssamProgressBar.SetMin(Value: Integer);
begin
if Value<>FMin then
begin
FMin:=Value;
Invalidate;
end;

end;



procedure TIssamProgressBar.SetProgress(Value: Integer);
begin
if Value<>FProgress then
begin
FProgress:=Value;

if Assigned(FOnProgress) then
   FOnProgress(self, FProgress);


Invalidate;
end;

end;

procedure TIssamProgressBar.SetProgressRect(Value: Boolean);
begin
if Value<>FProgressRect then
begin
FProgressRect:=Value;
Invalidate;
end;

end;

procedure TIssamProgressBar.SetProgressRectPen(Value: TPen);
begin
FProgressRectPen.Assign(Value);
Invalidate;

end;

procedure TIssamProgressBar.SetProgressSepration(Value: Integer);
begin
if Value<>FprogressSepration then
begin
FprogressSepration:=Value;
Invalidate;
end;
end;

procedure TIssamProgressBar.SetShowPercent(Value: Boolean);
begin
if Value<>FShowProgressPercentage then
begin
FShowProgressPercentage:=Value;
Invalidate;
end;
end;

procedure TIssamProgressBar.SetSmooth(Value: Boolean);
begin
 if Value<>FSmooth then
begin
FSmooth:=Value;
Invalidate;
end;
end;

procedure TIssamProgressBar.SetStep(Value: Integer);
begin
if Value<>Fstep then
begin
Fstep:=Value;
Invalidate;
end;
end;





procedure TIssamProgressBar.OnProgressHandler(Sender: TObject;
  const AProgress: Integer);
begin
  if Assigned(FOnProgress) then
    FOnProgress(self, FProgress);
end;

procedure TIssamProgressBar.SetBounds(Aleft, ATop, AWidth, AHeight: Integer);
var
  Rhrgn,Hhrgn:HRGN;
begin
  inherited;
if Canvas.HandleAllocated then
begin

//=====================
end;
end;
procedure TIssamProgressBar.CMMouseLeave(var Message: TMessage);
begin
if (Message.LParam = 0) and Assigned(FOnMouseLeave) then
      FOnMouseLeave(Self);
end;



procedure TIssamProgressBar.SetProgressText(Value: TProgressText);
begin
FProgressText.Assign(Value);
Invalidate;
end;

procedure TIssamProgressBar.SetCandyEffect(Value: TCandyEffect);
begin
FCandyEffrect.Assign(Value);
Invalidate;
end;

procedure TIssamProgressBar.LightEffect(var Btm: tbitmap; Amount: integer);
var x,y,i:integer;
    p1:pbytearray;
begin
for i:=1 to amount do
  for y:=0 to Btm.height-1 do begin
    p1:=Btm.scanline[y];
    for x:=0 to Btm.width-1 do begin
      p1[x*3]:=sinpixs(p1[x*3]);
      p1[x*3+1]:=sinpixs(p1[x*3+1]);
      p1[x*3+2]:=sinpixs(p1[x*3+2]);
      end;
    end;

end;

function TIssamProgressBar.sinpixs(a: integer): integer;
begin
result:=variant(sin(a/255*pi/2)*255);
end;

procedure TIssamProgressBar.SetProgressShape(Value: TProgressShape);
begin
if value <> FProgressShape then
begin
FProgressShape:=Value;
Invalidate;
end;
end;





procedure TIssamProgressBar.SetSectionsColors(Value: TSectionsColors);
begin
FSectionsColors.Assign(Value);
Invalidate;
end;

procedure TIssamProgressBar.SetBorderEdge(Value: Integer);
begin
if Value <>FBordersEdge then
begin
FBordersEdge:=Value;
Invalidate;
end;
end;

procedure TIssamProgressBar.SetTranparent(Value: Boolean);
begin
if Value<>FTransparent then
begin
FTransparent:=Value;
Invalidate;

end;
end;

function TIssamProgressBar.DrawRadiusLines(btmap: TBitmap; Center: TPoint;
  Radius1, Radius2, Max, Progress: Integer;
  BackGroundColor,StartColor,EndColor: Tcolor): Boolean;
var
    StepRad,CenterStep:Double;
    i,j,ProgressCount:Integer;
    InternalArias:array of TPoint;
    ExternalAngles:array of Double;
    PrgoressAngle:Double;
begin
  StepRad:=2*pi/50;   //50 is the ideal Value..
  if Max=0 then Exit;

  GradientFill(btmap.Canvas.Handle,Rect(0,0,150,150),EndColor,StartColor,true) ;

  btmap.Canvas.Brush.Style:=bsClear;
  btmap.Canvas.Pen.Width:=1;
  btmap.Canvas.Pen.Color:=$0064C5F9;
  btmap.Canvas.Ellipse(Center.X-Radius1,Center.Y-Radius1,Center.X+Radius1,Center.Y+Radius1);
  btmap.Canvas.Ellipse(Center.X-Radius2,Center.Y-Radius2,Center.X+Radius2,Center.Y+Radius2);

  SetLength(InternalArias,50);
  SetLength(ExternalAngles,50);

  CenterStep:=StepRad/2;
  btmap.Canvas.Pen.Width:=1;

  for i:=0 to 49 do                 //LineCount-1
  begin
  btmap.Canvas.MoveTo(Center.X,Center.Y);
  btmap.Canvas.LineTo(Center.X+Round(Radius1*cos(i*StepRad)),Center.y+Round(Radius1*sin(i*StepRad)));
  ExternalAngles[i]:=i*StepRad;
  InternalArias[i]:=Point(Center.X+Round((Radius2+((Radius1-Radius2)div 2))*cos(i*StepRad+CenterStep)),Center.y+Round((Radius2+((Radius1-Radius2)div 2))*sin(i*StepRad+CenterStep))) ;

  end;

  PrgoressAngle:=Progress*2*Pi/Max;         //lincount-1
  for ProgressCount:=1  to 49  do
  if  (PrgoressAngle>=ExternalAngles[ProgressCount-1])and (PrgoressAngle<=ExternalAngles[ProgressCount]) then Break;



    with btmap do                            // Fill the Progress..

    begin

    Canvas.Brush.Style:=bsSolid;
    
    for j:=ProgressCount to 49 do                    // for j:=0 to ProgressCount-1 do
    begin
    Canvas.MoveTo(Center.X,Center.Y);
  //  if Odd(j) then  Canvas.Brush.Color:=$00005EBB else Canvas.Brush.Color:=clRed;
    Canvas.Brush.Color:=BackGroundColor;
    Canvas.FloodFill(InternalArias[j].x,InternalArias[j].y,btmap.Canvas.Pen.Color,fsBorder);
    end;


    Canvas.Pen.width:=2;
    Canvas.Pen.Color:=clWhite;

    for i:=0 to 49 do
    begin
    Canvas.MoveTo(Center.X,Center.Y);
    Canvas.LineTo(Center.X+Round((Radius2-1)*cos(i*StepRad)),Center.y+Round((Radius2-1)*sin(i*StepRad)));
    end;



    end;

  //  with btmap do
  //  begin
    btmap.Canvas.Brush.Style:=bsSolid;                     //Hide the Centeral Circle
    btmap.Canvas.Brush.Color:=BackGroundColor;
    btmap.Canvas.Pen.width:=1;
    btmap.Canvas.Pen.Color:=BackGroundColor;//$00006BD7;
    btmap.Canvas.Ellipse(Center.X-Radius2,Center.Y-Radius2,Center.X+Radius2,Center.Y+Radius2);


  //  end;

  //========

  for i:=0 to 49 do                  // Hide The radius lines
  begin
  btmap.Canvas.MoveTo(Center.X,Center.Y);
  btmap.Canvas.LineTo(Center.X+Round(Radius1*cos(i*StepRad)),Center.y+Round(Radius1*sin(i*StepRad)));

  end;


  //===========



  btmap.Canvas.Font.Size:=round(Radius2/2);
  // Most Importent...
  btmap.Canvas.TextOut(Center.X-(btmap.Canvas.TextWidth(IntToStr(Round(100*Progress/Max))+'%')div 2),Center.Y-(btmap.Canvas.TextHeight(IntToStr(Round(100*Progress/Max))+'%')div 2),IntToStr(Round(100*Progress/Max))+'%');
  btmap.Canvas.Brush.Style:=bsClear;
  btmap.Canvas.pen.Color:=clblack;
  btmap.Canvas.Ellipse(Center.X-Radius1,Center.Y-Radius1,Center.X+Radius1,Center.Y+Radius1);

  btmap.Canvas.Brush.Color:=BackGroundColor;
  btmap.Canvas.FloodFill(1,1,clBlack,fsBorder);

  btmap.Canvas.Brush.Style:=bsClear;
  btmap.Canvas.pen.Color:=BackGroundColor;
  btmap.Canvas.Ellipse(Center.X-Radius1,Center.Y-Radius1,Center.X+Radius1,Center.Y+Radius1);

  btmap.Canvas.Brush.Style:=bsClear;
  btmap.Canvas.Ellipse(Center.X-Radius1,Center.Y-Radius1,Center.X+Radius1,Center.Y+Radius1);


end;

{ TBlocKRecord }

procedure TBlocKRecord.Assign(Other: TPersistent);
begin
 if Other is TBlocKRecord then begin
    FBlockWidth := TBlocKRecord(Other).FBlockWidth;
    FBlockSepration := TBlocKRecord(Other).FBlockSepration;
    FBlockStyle:=TBlocKRecord(Other).FBlockStyle;
    FRoundCorner:=TBlocKRecord(Other).FRoundCorner;


     if Assigned(FOnChange) then
       FOnChange(self);

  end else
    inherited;

end;







function TIssamProgressBar.AssignRect(SRect: TRect):Trect;
begin
with Result do
begin
    Left:=SRect.Left;
    Top:=SRect.Top;
    Right:=SRect.Right;
    Bottom:=SRect.Bottom;
end;
end;

procedure TBlocKRecord.SetBlockRoundCorner(Value: Integer);
begin
  if Value<>FRoundCorner then
FRoundCorner:=Value;

if Assigned(FOnChange) then
       FOnChange(self);

end;

procedure TBlocKRecord.SetBlockSepration(Value: Integer);
begin
if Value<>FBlockSepration then
FBlockSepration:=Value;

if Assigned(FOnChange) then
       FOnChange(self);

end;

procedure TBlocKRecord.SetBlockStyle(Value: TBlockStyle);
begin
if Value<>FBlockStyle then
FBlockStyle:=Value;
if Assigned(FOnChange) then
       FOnChange(self);
end;

procedure TBlocKRecord.SetBlockWidth(Value: Integer);
begin
if Value<>FBlockWidth then
FBlockWidth:=Value;

if Assigned(FOnChange) then
       FOnChange(self);
end;






procedure TIssamProgressBar.SetGradiantColors(Value: TGradiantColors);
begin
FGradiantColors.Assign(Value);
Invalidate;
end;

procedure TBlocKRecord.SetProgressFillSyle(Value: TProgressFillSyle);
begin
  if Value<>FProgressFillSyle then
FProgressFillSyle:=Value;

if Assigned(FOnChange) then
       FOnChange(self);

end;

{ TGradiantColors }

procedure TGradiantColors.Assign(Other: TPersistent);
begin
 if Other is TGradiantColors then begin
    FStartColor:= TGradiantColors(Other).FStartColor;
    FEndColor := TGradiantColors(Other).FEndColor;
    FGradientDirection:=TGradiantColors(Other).FGradientDirection;

     if Assigned(FOnChange) then
       FOnChange(self);

  end else
    inherited;

end;

procedure TGradiantColors.SetEndColor(Value: TColor);
begin
if Value<>FEndColor then
FEndColor:=Value;

if Assigned(FOnChange) then
       FOnChange(self);


end;

procedure TGradiantColors.SetGlowEffect(Value: Boolean);
begin
if Value<>FGlowEffect then
FGlowEffect:=Value;

if Assigned(FOnChange) then
       FOnChange(self);

end;

procedure TGradiantColors.SetGradientDirection(Value: TGradientDirection);
begin
if Value<>FGradientDirection then
FGradientDirection:=Value;

if Assigned(FOnChange) then
       FOnChange(self);
end;

procedure TGradiantColors.SetStartColor(Value: TColor);
begin

if Value<>FStartColor then
FStartColor:=Value;

if Assigned(FOnChange) then
       FOnChange(self);

end;

{ TProgressText }

procedure TProgressText.Assign(Other: TPersistent);
begin
 if Other is TProgressText then begin
    FStartTextColor:= TProgressText(Other).FStartTextColor;
    FMidTextColor := TProgressText(Other).FMidTextColor;
    FTextBox:=TProgressText(Other).FTextBox;
    FTextBoxColor:=TProgressText(Other).FTextBoxColor;
    FTextAlignemnt:=TProgressText(Other).FTextAlignemnt;

 if Assigned(FOnChange) then
    FOnChange(self);

  end else
    inherited;

end;

procedure TProgressText.SetMidTextColor(Value: Tcolor);
begin

if Value<>FMidTextColor then
FMidTextColor:=Value;

if Assigned(FOnChange) then
       FOnChange(self);

end;

procedure TProgressText.SetStartTextColor(Value: Tcolor);
begin

if Value<>FStartTextColor then
FStartTextColor:=Value;

if Assigned(FOnChange) then
       FOnChange(self);

end;

procedure TProgressText.SetTextAlignemnt(Value: TTextAlignemnt);
begin


if Value<>FTextAlignemnt then
FTextAlignemnt:=Value;

if Assigned(FOnChange) then
       FOnChange(self);

end;

procedure TProgressText.SetTextBox(Value: Boolean);
begin

if Value<>FTextBox then
FTextBox:=Value;

if Assigned(FOnChange) then
       FOnChange(self);

end;

procedure TProgressText.SetTextBoxColor(Value: TColor);
begin
if Value<>FTextBoxColor then
FTextBoxColor:=Value;

if Assigned(FOnChange) then
       FOnChange(self);
end;



procedure TProgressText.SetTextSize(Value: Integer);
begin
if Value<>FTextSize then
begin
  FTextSize:=Value ;

if Assigned(FOnChange) then
       FOnChange(self);

end;
end;

{ TCandyEffect }

procedure TCandyEffect.Assign(Other: TPersistent);
begin
 if Other is TCandyEffect then begin
    FCandyDirection:= TCandyEffect(Other).FCandyDirection;
    FCandyEffect := TCandyEffect(Other).FCandyEffect;
    FCandyFisrtColor:=TCandyEffect(Other).FCandyFisrtColor;
    FCandySecondColor:=TCandyEffect(Other).FCandySecondColor;


 if Assigned(FOnChange) then
    FOnChange(self);

  end else
    inherited;

end;

procedure TCandyEffect.SetCandyDirection(Value: TCandyDirection);
begin

if Value<>FCandyDirection then
FCandyDirection:=Value;

if Assigned(FOnChange) then
       FOnChange(self);

end;

procedure TCandyEffect.SetCandyEffect(Value: Boolean);
begin
if Value<>FCandyEffect then
FCandyEffect:=Value;

if Assigned(FOnChange) then
       FOnChange(self);
end;

procedure TCandyEffect.SetCandyFirstColor(Value: TColor);
begin
if Value<>FCandyFisrtColor then
FCandyFisrtColor:=Value;

if Assigned(FOnChange) then
FOnChange(self);
end;

procedure TCandyEffect.SetCandySecondColor(Value: TColor);
begin
if Value<>FCandySecondColor then
FCandySecondColor:=Value;

if Assigned(FOnChange) then
FOnChange(self);
end;

procedure TCandyEffect.SetPen(Value: Boolean);
begin

if Value<>Fpen then
FPen:=Value;

if Assigned(FOnChange) then
FOnChange(self);

end;

{ TColorSection }



constructor TColorSection.Create(Collection: TCollection);
begin
  inherited;
  if Collection<>nil then
  FOwner:=Collection.Owner;
end;

procedure TColorSection.SetColor(Value: TColor);
begin
if Value <> Fcolor then
Fcolor:=Value;

TIssamProgressBar(FOwner).Invalidate;


end;


procedure TColorSection.SetShowText(Value: Boolean);
begin
if Value <> FShowText then
FShowText:=Value;

TIssamProgressBar(FOwner).Invalidate;

end;

procedure TColorSection.SetText(Value: String);
begin
if Value <> FText then
FText:=Value;

TIssamProgressBar(FOwner).Invalidate;

end;

procedure TColorSection.SetTextColor(Value: TColor);
begin
if Value <> FTextColor then
FTextColor:=Value;

TIssamProgressBar(FOwner).Invalidate;

end;

{ TSectionsColors }

function TSectionsColors.Add: TColorSection;
begin
Result := TColorSection(inherited Add);

end;

procedure TSectionsColors.Assign(Other: TPersistent);
var
  I:Integer;
begin

 if Other is TSectionsColors then
 begin
    for i:=0 to Count-1  do
    Items[i]:= TSectionsColors(Other).Items[i];

   { if Assigned(FOnChange) then
    FOnChange(self);}
    TIssamProgressBar(FOwner).Invalidate;

  end else
  inherited;

end;

constructor TSectionsColors.Create(AOwner: TPersistent);
begin
  inherited Create(TColorSection);
  FOwner := AOwner;
end;



function TSectionsColors.GetItem(Index: Integer): TColorSection;
begin
Result := TColorSection(inherited GetItem(Index));

end;

function TSectionsColors.GetOwner: TPersistent;
begin
Result :=FOwner;

end;

procedure TSectionsColors.Notify(Item: TCollectionItem;
  Action: TCollectionNotification);
begin
  inherited;
  TIssamProgressBar(FOwner).Invalidate;
end;

procedure TSectionsColors.SetItem(Index: Integer; Value: TColorSection);
begin
inherited SetItem(Index, Value);
TIssamProgressBar(FOwner).Invalidate;

end;



end.
 