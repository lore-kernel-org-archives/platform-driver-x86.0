From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH 1/2] platform/x86: dell-smbios-wmi: Correct a memory leak
Date: Wed, 12 Sep 2018 12:14:34 +0000
Message-ID: <d140b6171dfe4e748b7491f4955c07be@ausx13mpc120.AMER.DELL.COM>
References: <1536602513-13861-1-git-send-email-mario.limonciello@dell.com>
 <20180910205139.GC5659@wrath>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180910205139.GC5659@wrath>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Darren,

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Monday, September 10, 2018 3:52 PM
> To: Limonciello, Mario
> Cc: Andy Shevchenko; LKML; platform-driver-x86@vger.kernel.org;
> stable@vger.kernel.org
> Subject: Re: [PATCH 1/2] platform/x86: dell-smbios-wmi: Correct a memory =
leak
>=20
> On Mon, Sep 10, 2018 at 01:01:52PM -0500, Mario Limonciello wrote:
> > ACPI buffers were being allocated but never freed.
> >
> > Reported-by: Pinzhen Xu <pinzhen.xu@intel.com>
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > Cc: stable@vger.kernel.org
>=20
> Thanks Mario and Pinzhen, both queued. That's an easy one to miss, the us=
age not
> being particularly obvious.
>=20

This cropped up and is fixed by that patch:
https://github.com/dell/libsmbios/issues/63

Given the impact and how small the patch is, I think it might be good if th=
is can come to 4.19-rcX if possible.
Thoughts?

I suspect this one might be the same issue too:
https://bugzilla.redhat.com/show_bug.cgi?id=3D1627609
