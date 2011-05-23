From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH 2/4] acer-wmi: check the existence of internal 3G
 device when set capability
Date: Mon, 23 May 2011 01:33:10 -0600
Message-ID: <4DDA9A56020000230002CF5E@novprvlin0050.provo.novell.com>
References: <1306020834-5186-1-git-send-email-jlee@novell.com>
 <BANLkTimLV6kujMT8j5vkhmR0OFKH+q6SMw@mail.gmail.com>
 <4DDA8DC8020000230002CF41@novprvlin0050.provo.novell.com>
 <201105230741.44906.carlos@strangeworlds.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <201105230741.44906.carlos@strangeworlds.co.uk>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: carlos@strangeworlds.co.uk
Cc: corentin.chary@gmail.com, dtor@mail.ru, Joey Lee <JLee@novell.com>, mjg@redhat.com, trenn@suse.de, platform-driver-x86@vger.kernel.org

Hi Carlos,=20

=E6=96=BC =E4=B8=80=EF=BC=8C2011-05-23 =E6=96=BC 07:41 +0100=EF=BC=8CCa=
rlos Corbacho =E6=8F=90=E5=88=B0=EF=BC=9A
> On Monday 23 May 2011 07:39:36 Joey Lee wrote:
> > > I'm not sure you can drop sysfs files like that, as it will break=
 the
> > > ABI.
> >>
> > > Could you document acer-wmi in
> > > Documentation/ABI/testing/sysfs-platform-acer-wmi.txt ?
> > > This allows to check when a sysfs file was added, who use it, etc=
=2E..
>=20
> I don't agree, the 3G sysfs interface should just be dropped as it's =
the only=20
> remaining sysfs stuff for this driver - it's not worth documenting as=
 it's=20
> already exposed as an rfkill device, and we've already dropped all th=
e=20
> remaining sysfs interfaces a long time ago without going through any =
of this.
>=20

After removed threeg sysfs file, there still have the latest one sysfs
file the name is "interface". It provide a interface to know which WMI
interface was used currently.

Should we also direct drop it from acer-wmi or move to debugfs?


Thank's a lot!
Joey Lee
