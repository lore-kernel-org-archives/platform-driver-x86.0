From: joeyli <jlee@suse.com>
Subject: Re: Supporting status LEDs in acer-wmi
Date: Fri, 14 Apr 2017 13:19:50 +0800
Message-ID: <20170414051950.GA2581@linux-l9pv.suse>
References: <CA+A7VXXd5mvMVJCzrz-oecS6jFdD7G4C=TxkEcH_SkxWvNWXiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:50986 "EHLO
        smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753943AbdDNFUK (ORCPT
        <rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
        Fri, 14 Apr 2017 01:20:10 -0400
Content-Disposition: inline
In-Reply-To: <CA+A7VXXd5mvMVJCzrz-oecS6jFdD7G4C=TxkEcH_SkxWvNWXiw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux@endlessm.com, =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@endlessm.com>

Hi,

On Tue, Apr 11, 2017 at 03:31:34PM -0400, João Paulo Rechi Vita wrote:
> Hello,
> 
> I'm working to support the status LEDs embedded in the "mic mute" and
> "radio toggle" buttons on a Acer TravelMate P648-G2-MG laptop, but
> can't quite get how these are controlled. I have traced the ACPI
> execution from Windows for both buttons, and tried to compare with a
> method tracing on Linux, but couldn't get much out of it.
> 
> For the mic mute button, I see _Q45, WMID._WED, WMID.EVBC and
> WMID.CLBC being called on both platforms. For the radios button, I see

I simply checked the code path of _Q45 and EVBC. The logic in EVBC is
controlled by EC:

ssdt11.dsl
    Method (EVBC, 0, Serialized)          /* called by _WED */
    {
	Local0 = DerefOf (FEBC [Zero])
	Switch (Local0)
	{
	    Case (One)                   /* case One is set in _Q45 */
	    {
		CLBC (0x04, 0x04)
		Local1 = DerefOf (FEBC [One])   /* FEBC [One] set to HTBN by _Q45, HTBN = 0x4a on Windows */
		Local2 = Zero
	... 

The HTBN is in the EC memory space: 

dsdt.dsl
	Device (EC0)
	{
	    Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
	    Name (_GPE, 0x50)  // _GPE: General Purpose Events
	    Name (OKEC, One)
	...
	    OperationRegion (ECMM, SystemMemory, 0xFF000800, 0x1000)
	    Field (ECMM, AnyAcc, Lock, Preserve)
	    {
		CDPR,   1,
		LCDS,   1,
		    ,   5,
		ISEN,   1,
		HTBN,   8,
	...

From your debugger log, the HTBN is 0x4a on windows:

ffff9f0d3f8dde53: | Store(HTBN=0x4a,Index(^^^WMID.FEBC=Buffer(0x8){

So, EVBC runs into the path to set 0x02 and 0x03 of FEBC and return
FEBC to _WED:

    Method (EVBC, 0, Serialized)               
    {
	Local0 = DerefOf (FEBC [Zero])          
	Switch (Local0)
	{
	    Case (One)                        
	    {
		CLBC (0x04, 0x04)
		Local1 = DerefOf (FEBC [One]) 
		Local2 = Zero
		If (((Local1 > Zero) && (Local1 < 0x20)))
		{
		...
		ElseIf (((Local1 > 0x80) && (Local1 < 0xA0)))
		...
		Else            /* 0x4a */
		{
		    FEBC [0x02] = Zero
		    FEBC [0x03] = Zero
		}
	...
	Return (FEBC) /* \_SB_.PCI0.WMID.FEBC */
    }

The point is what the HTBN value on Linux. I am not familiar with EC
logic. Sorry for can not give you too many help.

Thanks a lot!
Joey Lee
