From: Michael Marineau <michael.marineau@coreos.com>
Subject: Re: [Patch v3] apple-gmux: lock iGP IO to protect from vgaarb changes
Date: Tue, 26 May 2015 23:28:14 -0700
Message-ID: <CAGr1u3sBpENgVL9zF_LCFXtBv6S2FS5o1bRtFxwyn3P_kx=s-A@mail.gmail.com>
References: <20150223215155.18444386@neptune.home>
	<20150303172753.GF83894@vmdeb7>
	<20150305232038.1873d380@neptune.home>
	<20150306174254.GB19001@vmdeb7>
	<20150307011546.0050279d@neptune.home>
	<20150309225238.0b9ced4e@neptune.home>
	<CAErSpo61r-_hy1hfUMm2ooXZVLTBhtjd-x5uXbyEg=WcG=itnQ@mail.gmail.com>
	<20150311223445.6af76f7c@neptune.home>
	<CAGr1u3tKVtQno=hUrKemLFYG12dtvPjFVR7oFwDG5cewJGCnJQ@mail.gmail.com>
	<20150527044749.GB21644@fury.dvhart.com>
	<20150527075329.6df43854@pluto.restena.lu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20150527075329.6df43854@pluto.restena.lu>
Sender: linux-pci-owner@vger.kernel.org
To: =?UTF-8?Q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>
Cc: Darren Hart <dvhart@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Petri Hodju <petrihodju@yahoo.com>, Matthew Garrett <matthew.garrett@nebula.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, May 26, 2015 at 10:53 PM, Bruno Pr=C3=A9mont
<bonbons@linux-vserver.org> wrote:
> Hi Michael,
>
> On Tue, 26 May 2015 21:47:49 -0700 Darren Hart wrote:
>> On Tue, May 26, 2015 at 12:10:48PM -0700, Michael Marineau wrote:
>> > FYI, this actually broke backlight controls on my MBP11,3 because =
the
>> > assumption the patch makes that gmux is always loaded before graph=
ics
>> > drivers didn't hold true. At least for me dracut included the nouv=
eau
>> > module in the initrd but not gmux, ensuring the ordering was wrong=
=2E No
>> > errors were reporting, and gmux still offered the backlight device=
, it
>> > just became inoperable. I worked around this for my kernel by buil=
ding
>> > gmux into vmlinuz instead of as a module but that isn't going to i=
n
>> > more general configs because there is an apple backlight driver wh=
ich
>> > cannot be built at all in that configuration.
>>
>> Thank you for reporting this Michael,
>>
>> That is tough as nouveau doesn't have an explicit dependency on gmux=
, so we
>> could do something like a passive request_module(), but if it isn't =
in the
>> initrd image, it would still fail as you describe.
>>
>> > Is there a way to make the ordering between nouveau and gmux more
>> > explicit/reliable? Can gmux complain loudly if the ordering is eve=
r
>> > wrong?
>>
>> It should print an error if the probe fails due to the IO already be=
ing in use
>> or if it can't be allocated. The disabled IO case is only info level=
 though,
>> perhaps that should be higher priority. Printing something when fail=
ing to probe
>> seems like a reasonable thing to do.
>>
>> Michael, which message do you get if you boot with "debug" or "logle=
vel=3D6" when
>> apple-gmux is not built-in?
>
> A full kernel log up to including post-initrd loading of gmux would b=
e
> useful.
>
> As far as I have seen nouveau should not be doing unneeded vgaarb
> operations by itself (though userspace might be) as opposed to closed
> nvidia driver.
>
> If your systems allows, try booting to init=3D/bin/bash, then check f=
or
> backlight, load nouveau, check for backlight and finally load gmux an=
d
> check backlight (putting i915 in the mix where initrd/userspace puts
> it would be nice).

Both before and after loading nouveau there is a working acpi_video
backlight control. Then after loading gmux it is the only backlight
control and it doesn't do anything.
