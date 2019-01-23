From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 4.20 008/117] platform/x86: asus-wmi: Tell the EC
 the OS will handle the display off hotkey
Date: Wed, 23 Jan 2019 08:55:57 -0500
Message-ID: <20190123135557.GG202535@sasha-vm>
References: <20190108192628.121270-1-sashal@kernel.org>
 <20190108192628.121270-8-sashal@kernel.org>
 <CA+A7VXUA5CGqWMMX_C6sar14f1_TYHxL166bjkMMcW731ndeHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+A7VXUA5CGqWMMX_C6sar14f1_TYHxL166bjkMMcW731ndeHg@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Stable <stable@vger.kernel.org>, =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@endlessm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 08, 2019 at 04:49:18PM -0800, João Paulo Rechi Vita wrote:
>Hello Sasha,
>
>On Tue, Jan 8, 2019 at 11:26 AM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: João Paulo Rechi Vita <jprvita@gmail.com>
>>
>> [ Upstream commit 78f3ac76d9e5219589718b9e4733bee21627b3f5 ]
>>
>> In the past, Asus firmwares would change the panel backlight directly
>> through the EC when the display off hotkey (Fn+F7) was pressed, and
>> only notify the OS of such change, with 0x33 when the LCD was ON and
>> 0x34 when the LCD was OFF. These are currently mapped to
>> KEY_DISPLAYTOGGLE and KEY_DISPLAY_OFF, respectively.
>>
>> Most recently the EC on Asus most machines lost ability to toggle the
>> LCD backlight directly, but unless the OS informs the firmware it is
>> going to handle the display toggle hotkey events, the firmware still
>> tries change the brightness through the EC, to no effect. The end result
>> is a long list (at Endless we counted 11) of Asus laptop models where
>> the display toggle hotkey does not perform any action. Our firmware
>> engineers contacts at Asus were surprised that there were still machines
>> out there with the old behavior.
>>
>> Calling WMNB(ASUS_WMI_DEVID_BACKLIGHT==0x00050011, 2) on the _WDG device
>> tells the firmware that it should let the OS handle the display toggle
>> event, in which case it will simply notify the OS of a key press with
>> 0x35, as shown by the DSDT excerpts bellow.
>>
>>  Scope (_SB)
>>  {
>>      (...)
>>
>>      Device (ATKD)
>>      {
>>          (...)
>>
>>          Name (_WDG, Buffer (0x28)
>>          {
>>              /* 0000 */  0xD0, 0x5E, 0x84, 0x97, 0x6D, 0x4E, 0xDE, 0x11,
>>              /* 0008 */  0x8A, 0x39, 0x08, 0x00, 0x20, 0x0C, 0x9A, 0x66,
>>              /* 0010 */  0x4E, 0x42, 0x01, 0x02, 0x35, 0xBB, 0x3C, 0x0B,
>>              /* 0018 */  0xC2, 0xE3, 0xED, 0x45, 0x91, 0xC2, 0x4C, 0x5A,
>>              /* 0020 */  0x6D, 0x19, 0x5D, 0x1C, 0xFF, 0x00, 0x01, 0x08
>>          })
>>          Method (WMNB, 3, Serialized)
>>          {
>>              CreateDWordField (Arg2, Zero, IIA0)
>>              CreateDWordField (Arg2, 0x04, IIA1)
>>              Local0 = (Arg1 & 0xFFFFFFFF)
>>
>>              (...)
>>
>>              If ((Local0 == 0x53564544))
>>              {
>>                  (...)
>>
>>                  If ((IIA0 == 0x00050011))
>>                  {
>>                      If ((IIA1 == 0x02))
>>                      {
>>                          ^^PCI0.SBRG.EC0.SPIN (0x72, One)
>>                          ^^PCI0.SBRG.EC0.BLCT = One
>>                      }
>>
>>                      Return (One)
>>                  }
>>              }
>>              (...)
>>          }
>>          (...)
>>      }
>>      (...)
>>  }
>>  (...)
>>
>>  Scope (_SB.PCI0.SBRG.EC0)
>>  {
>>      (...)
>>
>>      Name (BLCT, Zero)
>>
>>      (...)
>>
>>      Method (_Q10, 0, NotSerialized)  // _Qxx: EC Query
>>      {
>>          If ((BLCT == Zero))
>>          {
>>              Local0 = One
>>              Local0 = RPIN (0x72)
>>              Local0 ^= One
>>              SPIN (0x72, Local0)
>>              If (ATKP)
>>              {
>>                  Local0 = (0x34 - Local0)
>>                  ^^^^ATKD.IANE (Local0)
>>              }
>>          }
>>          ElseIf ((BLCT == One))
>>          {
>>              If (ATKP)
>>              {
>>                  ^^^^ATKD.IANE (0x35)
>>              }
>>          }
>>      }
>>      (...)
>>  }
>>
>> Signed-off-by: João Paulo Rechi Vita <jprvita@endlessm.com>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>I am not entirely sure this is linux-stable material. This patch makes
>the "turn off the display backlight" hotkey work on some Asus machines
>where, without this patch, the key would simply do nothing. It seems
>to me this is more of a new feature support than a bug fix. That said,
>if you or Andy think this should go to stable after this short
>explanation, I'll not object it.

I think I'll keep this in. It looks a lot like a quirk to make this
device work.
