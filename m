From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Tue, 17 Nov 2015 19:44:20 -0800
Message-ID: <CALCETrWJ=Bd4S2VVb+XEQPxSRWiXjYTaKOcLjfp6-baTZqDufQ@mail.gmail.com>
References: <cover.1447479930.git.luto@kernel.org> <201511141713.48766@pali>
 <CALCETrWss=zCWhNkR2S_oi_m3W1xNO+UL_-uOnOVeLh5WHsDgQ@mail.gmail.com>
 <201511170936.08646@pali> <CALCETrVar=Uf1ptjcHNeq7Hb2ytvQunAURUwQ2e7mo9Nj5VsJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALCETrVar=Uf1ptjcHNeq7Hb2ytvQunAURUwQ2e7mo9Nj5VsJQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>, Mario Limonciello <mario_limonciello@dell.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, libsmbios-devel@lists.us.dell.com
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 17, 2015 at 11:03 AM, Andy Lutomirski <luto@amacapital.net>=
 wrote:
> On Nov 17, 2015 12:36 AM, "Pali Roh=C3=A1r" <pali.rohar@gmail.com> wr=
ote:
>>
>> On Saturday 14 November 2015 18:07:57 Andy Lutomirski wrote:
>> > [lots of people added]
>> >
>> > On Sat, Nov 14, 2015 at 8:13 AM, Pali Roh=C3=A1r <pali.rohar@gmail=
=2Ecom>
>> > wrote:
>> > > On Saturday 14 November 2015 16:48:25 Andy Lutomirski wrote:
>> > >> On Nov 14, 2015 1:27 AM, "Pali Roh=C3=A1r" <pali.rohar@gmail.co=
m> wrote:
>> > >> > On Friday 13 November 2015 21:49:30 Andy Lutomirski wrote:
>> > >> > > The XPS 13 Skylake has an rfkill button and a switchvideomo=
de
>> > >> > > button that aren't enumerated in the DMI table AFAICT.  Add=
 a
>> > >> > > table listing extra un-enumerated hotkeys.  To avoid breaki=
ng
>> > >> > > things that worked before, these un-enumerated hotkeys won'=
t
>> > >> > > be used if the DMI table maps them to something else.
>> > >> >
>> > >> > Do you have any (Dell) documentation which specify list of th=
ese
>> > >> > wmi codes send to dell-wmi driver?
>> > >>
>> > >> No.  Do you know where to get that documentation?
>> > >
>> > > Time to time Dell release some documentation or example code. Yo=
u
>> > > could ask Dell people on LKML (e.g. Mario Limonciello is active)
>> > > or on smbios mailing list libsmbios-devel@lists.us.dell.com.
>> > >
>> > > But currently there there are open questions about WMI hotkeys o=
n
>> > > Dell Vostro V131 which we cannot fix yet :-(
>> >
>> > On the Dell XPS 13 Skylake (XPS 13 9350), upstream Linux doesn't
>> > support the rfkill button.
>> >
>> > There seem to be three WMI events that aren't reflected in the OEM
>> > type 178 DMI table:
>> >
>> > 0x151: Fn-lock (no action needed by OS)
>> > 0x152: Switch video mode (should send KEY_SWITCHVIDEOMODE, but
>> > currently just warns)
>> > 0x153: rfkill -- currently warns, and see below.
>> >
>> > On several Dell models, there's the dell_rbtn (DELRBTN / DELLABCE)
>> > device.  It's here in the DSDT, too, but it seems to be disabled i=
f
>> > _OSI reports "Windows 2012" or "Windows 2013", so _STA returns zer=
o.
>> > (It also shows up as DELLRBC6, but I haven't tried all the _OSI
>> > hackery that seems to be needed in order to test the driver.)
>> >
>>
>> Hi!
>>
>> In your ASL code is:
>>
>>             Method (_STA, 0, NotSerialized)  // _STA: Status
>>             {
>>                 If ((OIDE () < One))
>>                 {
>>                     Return (0x0F)
>>                 }
>>
>>                 Return (Zero)
>>             }
>>
>> OIDE() returns 1 for Windows 8.
>>
>> This is quite interesting, on my Latitude E6440 is this ASL code:
>>
>>             Method (_STA, 0, NotSerialized)
>>             {
>>                 If (LLess (OIDE (), One))
>>                 {
>>                     Return (Zero)
>>                 }
>>
>>                 Return (0x0F)
>>             }
>>
>> And again OIDE() returns 1 for Windows 8. So behaviour is negated.
>>
>> Can you check if you have latest version of BIOS? Maybe Dell written
>> that condition incorrectly?
>>
>
> I'll check later on.  There's one newer version.

No relevant changes in 1.0.4.

--Andy
