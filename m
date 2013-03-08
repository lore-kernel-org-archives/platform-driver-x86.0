From: Shuah Khan <shuahkhan@gmail.com>
Subject: Re: [PATCH] hp_accel: Add a new PnP ID HPQ6007 for new HP laptops
Date: Fri, 8 Mar 2013 15:59:52 -0700
Message-ID: <CAKocOOMNgGxwoqxKCrvO_46vLALdjaDMHLeRyFZZ2veNgyJO2g@mail.gmail.com>
References: <s5h4ngz56yg.wl%tiwai@suse.de>
	<5135DBD5.1070702@tremplin-utc.net>
	<1362498177.7780.13.camel@x230>
	<s5hk3plu9yc.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <s5hk3plu9yc.wl%tiwai@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, =?ISO-8859-1?Q?=C9ric_Piel?= <eric.piel@tremplin-utc.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Mar 5, 2013 at 8:45 AM, Takashi Iwai <tiwai@suse.de> wrote:
> At Tue, 5 Mar 2013 15:42:58 +0000,
> Matthew Garrett wrote:
>>
>> On Tue, 2013-03-05 at 12:49 +0100, =C9ric Piel wrote:
>> > On 26/02/13 18:19, Takashi Iwai wrote:
>> > > The DriveGuard chips on the new HP laptops are with a new PnP ID
>> > > "HPQ6007".  It should be compatible with older chips.
>> > >
>> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
>> > Hi,
>> > Sorry for the delay. The driver is able to detect the actual type =
of
>> > accelerometer behind, so indeed it should work fine.
>> >
>> > Thanks for the patch, here is my:
>> > Acked-by: =C9ric Piel <eric.piel@tremplin-utc.net>
>> >
>> > Matthew, could you pick this patch into your tree?
>>
>> Will do.
>
> Thanks!
>
>
> Takashi

Takashi,

Should this be tagged for stables releases? This patch went into suse
git and just checking to see if it should go into stable releases.

Thanks,
-- Shuah
