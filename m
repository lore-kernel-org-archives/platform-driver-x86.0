From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH 2/4] acer-wmi: check the existence of internal 3G
 device when set capability
Date: Wed, 25 May 2011 01:07:00 -0600
Message-ID: <4DDD3734020000230002D0BB@novprvlin0050.provo.novell.com>
References: <1306020834-5186-1-git-send-email-jlee@novell.com>
 <201105230741.44906.carlos@strangeworlds.co.uk>
 <4DDA9A56020000230002CF5E@novprvlin0050.provo.novell.com>
 <201105231954.19779.carlos@strangeworlds.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <201105231954.19779.carlos@strangeworlds.co.uk>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: carlos@strangeworlds.co.uk
Cc: corentin.chary@gmail.com, dtor@mail.ru, Joey Lee <JLee@novell.com>, mjg@redhat.com, trenn@suse.de, platform-driver-x86@vger.kernel.org

Hi Carlos,=20

=E6=96=BC =E4=B8=80=EF=BC=8C2011-05-23 =E6=96=BC 19:54 +0100=EF=BC=8CCa=
rlos Corbacho =E6=8F=90=E5=88=B0=EF=BC=9A
> On Monday 23 May 2011 08:33:10 Joey Lee wrote:
> > After removed threeg sysfs file, there still have the latest one sy=
sfs
> > file the name is "interface". It provide a interface to know which =
WMI
> > interface was used currently.
> >=20
> > Should we also direct drop it from acer-wmi or move to debugfs?
>=20
> I'd say drop it, the logs are more useful anyway and I doubt it's bee=
n updated=20
> to be useful with your recent work either.
>=20
> -Carlos

You are right, just need add a log when acer-wmi probed but don't need
maintain a sysfs file.
I will send out patch to drop it and add log.


Thank's
Joey Lee
