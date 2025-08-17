//+------------------------------------------------------------------+
//|                                            Stochastic_Threads.mq5|
//|                       Copyright © 2025, MetaQuotes Software Corp.|
//|                                                    Original MQL4 |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2025, MetaQuotes Software Corp."
#property link      "https://www.mql5.com  "
#property version   "1.00"

#property indicator_separate_window
#property indicator_buffers 32
#property indicator_plots   32

//--- Plot 1 Properties (Stochastic #1)
#property indicator_label1  "K(1)"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrMagenta
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1
#property indicator_label2  "D(1)"
#property indicator_type2   DRAW_LINE
#property indicator_color2  clrLightSeaGreen
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

//--- Plot 2 Properties (Stochastic #2)
#property indicator_label3  "K(2)"
#property indicator_type3   DRAW_LINE
#property indicator_color3  clrMagenta
#property indicator_style3  STYLE_SOLID
#property indicator_width3  1
#property indicator_label4  "D(2)"
#property indicator_type4   DRAW_LINE
#property indicator_color4  clrLightSeaGreen
#property indicator_style4  STYLE_SOLID
#property indicator_width4  1

//--- Plot 3 Properties (Stochastic #3)
#property indicator_label5  "K(3)"
#property indicator_type5   DRAW_LINE
#property indicator_color5  clrMagenta
#property indicator_style5  STYLE_SOLID
#property indicator_width5  1
#property indicator_label6  "D(3)"
#property indicator_type6   DRAW_LINE
#property indicator_color6  clrLightSeaGreen
#property indicator_style6  STYLE_SOLID
#property indicator_width6  1

//--- Plot 4 Properties (Stochastic #4)
#property indicator_label7  "K(4)"
#property indicator_type7   DRAW_LINE
#property indicator_color7  clrMagenta
#property indicator_style7  STYLE_SOLID
#property indicator_width7  1
#property indicator_label8  "D(4)"
#property indicator_type8   DRAW_LINE
#property indicator_color8  clrLightSeaGreen
#property indicator_style8  STYLE_SOLID
#property indicator_width8  1

//--- Plot 5 Properties (Stochastic #5)
#property indicator_label9  "K(5)"
#property indicator_type9   DRAW_LINE
#property indicator_color9  clrMagenta
#property indicator_style9  STYLE_SOLID
#property indicator_width9  1
#property indicator_label10  "D(5)"
#property indicator_type10   DRAW_LINE
#property indicator_color10  clrLightSeaGreen
#property indicator_style10  STYLE_SOLID
#property indicator_width10  1

//--- Plot 6 Properties (Stochastic #6)
#property indicator_label11  "K(6)"
#property indicator_type11   DRAW_LINE
#property indicator_color11  clrMagenta
#property indicator_style11  STYLE_SOLID
#property indicator_width11  1
#property indicator_label12  "D(6)"
#property indicator_type12   DRAW_LINE
#property indicator_color12  clrLightSeaGreen
#property indicator_style12  STYLE_SOLID
#property indicator_width12  1

//--- Hide K(7)–K(16) by default
#property indicator_type13  DRAW_NONE  // K(7)
#property indicator_type15  DRAW_NONE  // K(8)
#property indicator_type17  DRAW_NONE  // K(9)
#property indicator_type19  DRAW_NONE  // K(10)
#property indicator_type21  DRAW_NONE  // K(11)
#property indicator_type23  DRAW_NONE  // K(12)
#property indicator_type25  DRAW_NONE  // K(13)
#property indicator_type27  DRAW_NONE  // K(14)
#property indicator_type29  DRAW_NONE  // K(15)
#property indicator_type31  DRAW_NONE  // K(16)

//--- Plot remaining D-lines (7)–(16)
#property indicator_label14 "D(7)"
#property indicator_type14  DRAW_LINE
#property indicator_color14 clrLightSeaGreen
#property indicator_label16 "D(8)"
#property indicator_type16  DRAW_LINE
#property indicator_color16 clrLightSeaGreen
#property indicator_label18 "D(9)"
#property indicator_type18  DRAW_LINE
#property indicator_color18 clrLightSeaGreen
#property indicator_label20 "D(10)"
#property indicator_type20  DRAW_LINE
#property indicator_color20 clrLightSeaGreen
#property indicator_label22 "D(11)"
#property indicator_type22  DRAW_LINE
#property indicator_color22 clrLightSeaGreen
#property indicator_label24 "D(12)"
#property indicator_type24  DRAW_LINE
#property indicator_color24 clrLightSeaGreen
#property indicator_label26 "D(13)"
#property indicator_type26  DRAW_LINE
#property indicator_color26 clrLightSeaGreen
#property indicator_label28 "D(14)"
#property indicator_type28  DRAW_LINE
#property indicator_color28 clrLightSeaGreen
#property indicator_label30 "D(15)"
#property indicator_type30  DRAW_LINE
#property indicator_color30 clrLightSeaGreen
#property indicator_label32 "D(16)"
#property indicator_type32  DRAW_LINE
#property indicator_color32 clrLightSeaGreen

//--- зададим граничные значения индикатора
#property indicator_minimum 0
#property indicator_maximum 100
//--- горизонтальные уровни в окне индикатора
#property indicator_level1  -100.0
#property indicator_level2  100.0

//--- input parameters
input ENUM_TIMEFRAMES   TimeFrame   = PERIOD_CURRENT; // Timeframe for calculation
input ENUM_MA_METHOD    MAMethod    = MODE_LWMA;      // MA Method for all Stochastics
input ENUM_STO_PRICE    PriceField  = STO_CLOSECLOSE; // Price field for all Stochastics

input int KPeriod1 = 38;
input int DPeriod1 = 8;
input int Slowing1 = 2;

input int KPeriod2 = 38;
input int DPeriod2 = 9;
input int Slowing2 = 3;

input int KPeriod3 = 38;
input int DPeriod3 = 10;
input int Slowing3 = 4;

input int KPeriod4 = 38;
input int DPeriod4 = 11;
input int Slowing4 = 5; 

input int KPeriod5 = 38;
input int DPeriod5 = 12;
input int Slowing5 = 6;

input int KPeriod6 = 38;
input int DPeriod6 = 13;
input int Slowing6 = 7;

input int KPeriod7 = 38;
input int DPeriod7 = 14;
input int Slowing7 = 8;

input int KPeriod8 = 38;
input int DPeriod8 = 15;
input int Slowing8 = 9;

input int KPeriod9 = 38;
input int DPeriod9 = 16;
input int Slowing9 = 10;

input int KPeriod10 = 38;
input int DPeriod10 = 17;
input int Slowing10 = 11;

input int KPeriod11 = 38;
input int DPeriod11 = 18;
input int Slowing11 = 12;

input int KPeriod12 = 38;
input int DPeriod12 = 19;
input int Slowing12 = 13;

input int KPeriod13 = 38;
input int DPeriod13 = 20;
input int Slowing13 = 14;

input int KPeriod14 = 38;
input int DPeriod14 = 21;
input int Slowing14 = 15;

input int KPeriod15 = 38;
input int DPeriod15 = 22;
input int Slowing15 = 16;

input int KPeriod16 = 38;
input int DPeriod16 = 23;
input int Slowing16 = 17;


//--- Indicator Buffers
double ExtMapBuffer1[],  ExtMapBuffer2[],  ExtMapBuffer3[],  ExtMapBuffer4[];
double ExtMapBuffer5[],  ExtMapBuffer6[],  ExtMapBuffer7[],  ExtMapBuffer8[];
double ExtMapBuffer9[],  ExtMapBuffer10[], ExtMapBuffer11[], ExtMapBuffer12[];
double ExtMapBuffer13[], ExtMapBuffer14[], ExtMapBuffer15[], ExtMapBuffer16[];
double ExtMapBuffer17[], ExtMapBuffer18[], ExtMapBuffer19[], ExtMapBuffer20[];
double ExtMapBuffer21[], ExtMapBuffer22[], ExtMapBuffer23[], ExtMapBuffer24[];
double ExtMapBuffer25[], ExtMapBuffer26[], ExtMapBuffer27[], ExtMapBuffer28[];
double ExtMapBuffer29[], ExtMapBuffer30[], ExtMapBuffer31[], ExtMapBuffer32[];

//--- Indicator Handles
int StochHandles[16];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
   //--- Indicator buffers mapping
   SetIndexBuffer(0,  ExtMapBuffer1,  INDICATOR_DATA);
   SetIndexBuffer(1,  ExtMapBuffer2,  INDICATOR_DATA);
   SetIndexBuffer(2,  ExtMapBuffer3,  INDICATOR_DATA);
   SetIndexBuffer(3,  ExtMapBuffer4,  INDICATOR_DATA);
   SetIndexBuffer(4,  ExtMapBuffer5,  INDICATOR_DATA);
   SetIndexBuffer(5,  ExtMapBuffer6,  INDICATOR_DATA);
   SetIndexBuffer(6,  ExtMapBuffer7,  INDICATOR_DATA);
   SetIndexBuffer(7,  ExtMapBuffer8,  INDICATOR_DATA);
   SetIndexBuffer(8,  ExtMapBuffer9,  INDICATOR_DATA);
   SetIndexBuffer(9,  ExtMapBuffer10, INDICATOR_DATA);
   SetIndexBuffer(10, ExtMapBuffer11, INDICATOR_DATA);
   SetIndexBuffer(11, ExtMapBuffer12, INDICATOR_DATA);
   SetIndexBuffer(12, ExtMapBuffer13, INDICATOR_DATA);
   SetIndexBuffer(13, ExtMapBuffer14, INDICATOR_DATA);
   SetIndexBuffer(14, ExtMapBuffer15, INDICATOR_DATA);
   SetIndexBuffer(15, ExtMapBuffer16, INDICATOR_DATA);
   SetIndexBuffer(16, ExtMapBuffer17, INDICATOR_DATA);
   SetIndexBuffer(17, ExtMapBuffer18, INDICATOR_DATA);
   SetIndexBuffer(18, ExtMapBuffer19, INDICATOR_DATA);
   SetIndexBuffer(19, ExtMapBuffer20, INDICATOR_DATA);
   SetIndexBuffer(20, ExtMapBuffer21, INDICATOR_DATA);
   SetIndexBuffer(21, ExtMapBuffer22, INDICATOR_DATA);
   SetIndexBuffer(22, ExtMapBuffer23, INDICATOR_DATA);
   SetIndexBuffer(23, ExtMapBuffer24, INDICATOR_DATA);
   SetIndexBuffer(24, ExtMapBuffer25, INDICATOR_DATA);
   SetIndexBuffer(25, ExtMapBuffer26, INDICATOR_DATA);
   SetIndexBuffer(26, ExtMapBuffer27, INDICATOR_DATA);
   SetIndexBuffer(27, ExtMapBuffer28, INDICATOR_DATA);
   SetIndexBuffer(28, ExtMapBuffer29, INDICATOR_DATA);
   SetIndexBuffer(29, ExtMapBuffer30, INDICATOR_DATA);
   SetIndexBuffer(30, ExtMapBuffer31, INDICATOR_DATA);
   SetIndexBuffer(31, ExtMapBuffer32, INDICATOR_DATA);

   for(int idx = 0; idx < 32; idx++)
      SetIndexEmptyValue(idx, EMPTY_VALUE);

   //--- Get indicator handles
   string symbol = _Symbol;
   ENUM_TIMEFRAMES timeframe = (TimeFrame == PERIOD_CURRENT) ? _Period : TimeFrame;

   //--- Create all stochastic handles
   StochHandles[0]  = iStochastic(symbol, timeframe, KPeriod1,  DPeriod1,  Slowing1,  MAMethod, PriceField);
   StochHandles[1]  = iStochastic(symbol, timeframe, KPeriod2,  DPeriod2,  Slowing2,  MAMethod, PriceField);
   StochHandles[2]  = iStochastic(symbol, timeframe, KPeriod3,  DPeriod3,  Slowing3,  MAMethod, PriceField);
   StochHandles[3]  = iStochastic(symbol, timeframe, KPeriod4,  DPeriod4,  Slowing4,  MAMethod, PriceField);
   StochHandles[4]  = iStochastic(symbol, timeframe, KPeriod5,  DPeriod5,  Slowing5,  MAMethod, PriceField);
   StochHandles[5]  = iStochastic(symbol, timeframe, KPeriod6,  DPeriod6,  Slowing6,  MAMethod, PriceField);
   StochHandles[6]  = iStochastic(symbol, timeframe, KPeriod7,  DPeriod7,  Slowing7,  MAMethod, PriceField);
   StochHandles[7]  = iStochastic(symbol, timeframe, KPeriod8,  DPeriod8,  Slowing8,  MAMethod, PriceField);
   StochHandles[8]  = iStochastic(symbol, timeframe, KPeriod9,  DPeriod9,  Slowing9,  MAMethod, PriceField);
   StochHandles[9]  = iStochastic(symbol, timeframe, KPeriod10, DPeriod10, Slowing10, MAMethod, PriceField);
   StochHandles[10] = iStochastic(symbol, timeframe, KPeriod11, DPeriod11, Slowing11, MAMethod, PriceField);
   StochHandles[11] = iStochastic(symbol, timeframe, KPeriod12, DPeriod12, Slowing12, MAMethod, PriceField);
   StochHandles[12] = iStochastic(symbol, timeframe, KPeriod13, DPeriod13, Slowing13, MAMethod, PriceField);
   StochHandles[13] = iStochastic(symbol, timeframe, KPeriod14, DPeriod14, Slowing14, MAMethod, PriceField);
   StochHandles[14] = iStochastic(symbol, timeframe, KPeriod15, DPeriod15, Slowing15, MAMethod, PriceField);
   StochHandles[15] = iStochastic(symbol, timeframe, KPeriod16, DPeriod16, Slowing16, MAMethod, PriceField);

   //--- Check handles
   for(int i = 0; i < 16; i++)
   {
      if(StochHandles[i] == INVALID_HANDLE)
      {
         Print("Failed to create Stochastic handle #", i + 1);
         return(INIT_FAILED);
      }
   }
   
   //--- Set indicator name
   IndicatorSetString(INDICATOR_SHORTNAME, "Stochastic Threads");
   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Custom indicator deinitialization                                |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   for(int i = 0; i < 16; i++)
   {
      if(StochHandles[i] != INVALID_HANDLE)
         IndicatorRelease(StochHandles[i]);
   }
}

//+------------------------------------------------------------------+
//| Helper: assign K/D values to buffers for handle index j          |
//+------------------------------------------------------------------+
void AssignToBuffersByHandleIndex(const int j, const int i, const double k_value, const double d_value)
{
   switch(j)
   {
      case 0:  ExtMapBuffer1[i]  = k_value; ExtMapBuffer2[i]  = d_value; break;
      case 1:  ExtMapBuffer3[i]  = k_value; ExtMapBuffer4[i]  = d_value; break;
      case 2:  ExtMapBuffer5[i]  = k_value; ExtMapBuffer6[i]  = d_value; break;
      case 3:  ExtMapBuffer7[i]  = k_value; ExtMapBuffer8[i]  = d_value; break;
      case 4:  ExtMapBuffer9[i]  = k_value; ExtMapBuffer10[i] = d_value; break;
      case 5:  ExtMapBuffer11[i] = k_value; ExtMapBuffer12[i] = d_value; break;
      case 6:  ExtMapBuffer13[i] = k_value; ExtMapBuffer14[i] = d_value; break;
      case 7:  ExtMapBuffer15[i] = k_value; ExtMapBuffer16[i] = d_value; break;
      case 8:  ExtMapBuffer17[i] = k_value; ExtMapBuffer18[i] = d_value; break;
      case 9:  ExtMapBuffer19[i] = k_value; ExtMapBuffer20[i] = d_value; break;
      case 10: ExtMapBuffer21[i] = k_value; ExtMapBuffer22[i] = d_value; break;
      case 11: ExtMapBuffer23[i] = k_value; ExtMapBuffer24[i] = d_value; break;
      case 12: ExtMapBuffer25[i] = k_value; ExtMapBuffer26[i] = d_value; break;
      case 13: ExtMapBuffer27[i] = k_value; ExtMapBuffer28[i] = d_value; break;
      case 14: ExtMapBuffer29[i] = k_value; ExtMapBuffer30[i] = d_value; break;
      case 15: ExtMapBuffer31[i] = k_value; ExtMapBuffer32[i] = d_value; break;
   }
}

//+------------------------------------------------------------------+
//| Custom indicator calculation function                            |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime& time[],
                const double& open[],
                const double& high[],
                const double& low[],
                const double& close[],
                const long& tick_volume[],
                const long& volume[],
                const int& spread[])
{
   if(rates_total <= 0)
      return 0;

   const int start_pos = (prev_calculated > 0) ? prev_calculated - 1 : 0;

   //--- Prepare multi-timeframe mapping (chart -> target timeframe)
   const string symbol = _Symbol;
   const ENUM_TIMEFRAMES timeframe = (TimeFrame == PERIOD_CURRENT) ? _Period : TimeFrame;

   // Build shift map from chart bars to target timeframe bars (align to containing higher-TF bar)
   int max_shift = -1;
   int shift_map_size = rates_total;
   static int shift_map[];
   ArrayResize(shift_map, shift_map_size);

   for(int i = start_pos; i < rates_total; i++)
   {
      int sh = iBarShift(symbol, timeframe, time[i], false);
      if(sh >= 0)
      {
         datetime sh_time = iTime(symbol, timeframe, sh);
         if(sh_time > time[i]) sh++; // ensure we map to the bar that started before time[i]
      }
      shift_map[i] = sh;
      if(sh > max_shift)
         max_shift = sh;
   }

   if(max_shift < 0)
   {
      // No data available on target timeframe for requested range
      for(int i = start_pos; i < rates_total; i++)
      {
         for(int j = 0; j < 16; j++)
            AssignToBuffersByHandleIndex(j, i, EMPTY_VALUE, EMPTY_VALUE);
      }
      return rates_total;
   }

   const int need_count = max_shift + 1;

   // Temporary storage for batch copy per handle
   double k_arr[];
   double d_arr[];
   ArrayResize(k_arr, need_count);
   ArrayResize(d_arr, need_count);

   //--- For each stochastic handle, copy once and distribute
   for(int j = 0; j < 16; j++)
   {
      int copied_k = CopyBuffer(StochHandles[j], 0, 0, need_count, k_arr);
      int copied_d = CopyBuffer(StochHandles[j], 1, 0, need_count, d_arr);

      if(copied_k <= 0 || copied_d <= 0)
      {
         // Fill with EMPTY_VALUE if copy failed
         for(int i = start_pos; i < rates_total; i++)
            AssignToBuffersByHandleIndex(j, i, EMPTY_VALUE, EMPTY_VALUE);
         continue;
      }

      // Distribute values to chart bars based on shift map
      for(int i = start_pos; i < rates_total; i++)
      {
         int sh = shift_map[i];
         if(sh >= 0 && sh < copied_k && sh < copied_d)
            AssignToBuffersByHandleIndex(j, i, k_arr[sh], d_arr[sh]);
         else
            AssignToBuffersByHandleIndex(j, i, EMPTY_VALUE, EMPTY_VALUE);
      }
   }

   return rates_total;
}
//+------------------------------------------------------------------+