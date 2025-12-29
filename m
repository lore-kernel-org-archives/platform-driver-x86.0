Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B28A1E991B
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 13:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013944; cv=none; b=hGerLKPxhiK5nDZf30iTwVjrE6+Po5adYb7OufIOGTigSNUREhe5Vcke+fELa/wWAxI8xF0DrmicY26WEOH3eqdZxCeIapPg5Fkk6YitxXM0/cOYV6/K4JXI5ob2J/cqXFf6/gpkkIN6ZodpFovOMYdKY/XPGF7xgAoCWyFahHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013944; c=relaxed/simple;
	bh=8j8PJvBqAFUNm0s/K8a4bewqh7obsgEziwJb/K20F6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E44WsNTsx4LSqSZ1heV55JQQ4hy4qDheUus2heetsBY9GCsba1lqDnmSJ87Nxccd5QI/79qiMtn+TA/BcsKBl1/yLhNbzF+3Ok8p48cusUMmms1pkD2+A7Hf2GLpvFmmXp8EModIbV9SerekdK7stkof15nzvl0+5SmNximUAsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADX92VAq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADX92VAq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC859C2BC9E
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 13:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767013944;
	bh=8j8PJvBqAFUNm0s/K8a4bewqh7obsgEziwJb/K20F6g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ADX92VAqT4q4lnf/AEfS9qa1ZpvC/96AX+FtUBiEO4yAUp0f5jFcC647Axr6DTIoj
	 cMgNeXZP6A3uChFR6C5AT26G6p2GmrUgq1fx+XeXWHrZIbF54/YMsPHPy0cIXP7Czp
	 VOwTH0rEkwWEzDJghmMls0dC0ejuonBtm+eGakCeGBkupybpSCbo4gQgr71h2mKoA9
	 f2zNio16Q+tOjdiRAS6xutDPM6AOVMSo2j+J4NS3BMGz507LW0MjXbVQOrd883muYL
	 pVdzGOhK8zdHrVceY+iV5frAYyN1rMuxF+IkAx3hgXY9O+vy+dxrKLI/piywX36ZRV
	 6GSqHmJth/jiw==
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7c75387bb27so3763891a34.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 05:12:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBCNqJHdPEEhavttxSpcZ70VsnWgKGLZmnu9sMjqcsOljSeMe8pgkdtpseyefBozJ8cRq1gdf5gkgkGjH8R60fctWC@vger.kernel.org
X-Gm-Message-State: AOJu0YzKVLz+ElmfSsb9LEiJrXuFQXcFRNKMtihATp7LJXeo4cs60oMc
	VN1Haspy3LTMa3InOw3iHSaWJwL7ZpfnwKRef6ynPREWYdMQEBB1CSgU0MRxi8gRHuvr+2zrsZH
	bN6yD4t1WWt3lDmkegiXzuJzxk2LeaGc=
X-Google-Smtp-Source: AGHT+IHu7SaPTl+UPMGGbLmcmLi1nV8rmm9LcpSgYkPfEGpEv7r8RhEaYYAoXURbyDY5wtkb8nFAWtq153mXoLYVMT0=
X-Received: by 2002:a05:6830:2646:b0:7c7:1c87:4f95 with SMTP id
 46e09a7af769-7cc668e9548mr14637005a34.4.1767013942944; Mon, 29 Dec 2025
 05:12:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7888874.EvYhyI6sBW@rafael.j.wysocki> <9550709.CDJkKcVGEf@rafael.j.wysocki>
 <aVGA9Mgwht_4nlPD@smile.fi.intel.com>
In-Reply-To: <aVGA9Mgwht_4nlPD@smile.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 29 Dec 2025 14:12:10 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0h-uOs1Q3RXxsbw4AOxTvY5siGrnxSLfXfk+Ea-ZUz7bQ@mail.gmail.com>
X-Gm-Features: AQt7F2q3nJYslczl3eVKh1V4gwab1SIo8SgJXXwRDBaWAsN0j4uQOK1nyg5zJ_U
Message-ID: <CAJZ5v0h-uOs1Q3RXxsbw4AOxTvY5siGrnxSLfXfk+Ea-ZUz7bQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] ACPI: PNP: Drop PNP0C01 and PNP0C02 from acpi_pnp_device_ids[]
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Chen Yu <yu.c.chen@intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linux PCI <linux-pci@vger.kernel.org>, 
	Alex Hung <alexhung@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, AceLan Kao <acelan.kao@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 8:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Dec 15, 2025 at 02:34:06PM +0100, Rafael J. Wysocki wrote:
>
> > There is a long-standing problem with ACPI device enumeration that
> > if the given device has a compatible ID which is one of the generic
> > system resource device IDs (PNP0C01 and PNP0C02), it will be claimed
> > by the PNP scan handler and it will not be represented as a platform
> > device, so it cannot be handled by a platform driver.
> >
> > Drivers have been working around this issue by "manually" creating
> > platform devices that they can bind to (see the Intel HID driver for
> > one example) or adding their device IDs to acpi_nonpnp_device_ids[].
> > None of the above is particularly clean though and the only reason why
> > the PNP0C01 and PNP0C02 device IDs are present in acpi_pnp_device_ids[]
> > is to allow the legacy PNP system driver to bind to those devices and
> > reserve their resources so they are not used going forward.
> >
> > Obviously, to address this problem PNP0C01 and PNP0C02 need to be
> > dropped from acpi_pnp_device_ids[], but doing so without making any
> > other changes would be problematic because the ACPI core would then
> > create platform devices for the generic system resource device objects
> > and that would not work on all systems for two reasons.  First, the
> > PNP system driver explicitly avoids reserving I/O resources below the
> > "standard PC hardware" boundary, 0x100, to avoid conflicts in that rang=
e
> > (one possible case when this may happen is when the CMOS RTC driver is
> > involved), but the platform device creation code does not do that.
> > Second, there may be resource conflicts between the "system" devices an=
d
> > the other devices in the system, possibly including conflicts with PCI
> > BARs.  Registering the PNP system driver via fs_initcall() helps to
> > manage those conflicts, even though it does not make them go away.
> > Resource conflicts during the registration of "motherboard resources"
> > that occur after PCI has claimed BARs are harmless as a rule and do
> > not need to be addressed in any specific way.
> >
> > To overcome the issues mentioned above, use the observation that it
> > is not actually necessary to create any device objects in addition
> > to struct acpi_device ones in order to reserve the "system" device
> > resources because that can be done directly in the ACPI device
> > enumeration code.
> >
> > Namely, modify acpi_default_enumeration() to add the given ACPI device
> > object to a special "system devices" list if its _HID is either PNP0C01
> > or PNP0C02 without creating a platform device for it.  Next, add a new
> > special acpi_scan_claim_resources() function that will be run via
> > fs_initcall() and will walk that list and reserve resources for each
> > device in it along the lines of what the PNP system driver does.
> >
> > Having made the above changes, drop PNP0C01 and PNP0C02 from
> > acpi_pnp_device_ids[] which will allow platform devices to be created
> > for ACPI device objects whose _CID lists contain PNP0C01 or PNP0C02,
> > but the _HID is not in acpi_pnp_device_ids[].
>
> ...
>
> > +static const char * const acpi_system_dev_ids[] =3D {
> > +     "PNP0C01", /* Memory controller */
> > +     "PNP0C02", /* Motherboard resource */
> > +     NULL
> > +};
>
> ...
>
> > +     if (match_string(acpi_system_dev_ids, -1, acpi_device_hid(device)=
) >=3D 0) {
>
> Using -1 makes sense when we have no direct visibility of the mentioned a=
rray.
> Here we have it visible and statically defined, hence the ARRAY_SIZE() is=
 more
> appropriate.

But as it stands it is more consistent with what happens elsewhere in this =
file.

> > +             struct acpi_scan_system_dev *sd;
> > +
> > +             /*
> > +              * This is a generic system device, so there is no need t=
o
> > +              * create a platform device for it, but its resources nee=
d to be
> > +              * reserved.  However, that needs to be done after all of=
 the
> > +              * other device objects have been processed and PCI has c=
laimed
> > +              * BARs in case there are resource conflicts.
> > +              */
> > +             sd =3D kmalloc(sizeof(*sd), GFP_KERNEL);
> > +             if (sd) {
> > +                     sd->adev =3D device;
> > +                     list_add_tail(&sd->node, &acpi_scan_system_dev_li=
st);
> > +             }
> > +     } else {
> > +             /* For a regular device object, create a platform device.=
 */
> > +             acpi_create_platform_device(device, NULL);
> > +     }
> > +     acpi_device_set_enumerated(device);
> >  }
>
> ...
>
> > +static void acpi_scan_claim_resources(struct acpi_device *adev)
> > +{
> > +     struct list_head resource_list =3D LIST_HEAD_INIT(resource_list);
> > +     struct resource_entry *rentry;
> > +     unsigned int count =3D 0;
> > +     const char *regionid;
>
> > +     if (acpi_dev_get_resources(adev, &resource_list, NULL, NULL) <=3D=
 0)
> > +             return;
>
> Strictly speaking the acpi_dev_free_resource_list() still needs to be cal=
led
> on 0 return as it's called only for the error cases.

The return value of 0 means that the list is empty, so there's nothing to f=
ree.

> I think this is the first and the only time I see a combined comparison <=
=3D 0
> for the acpi_dev_get_resources().

I don't see a problem here though.

> > +     regionid =3D kstrdup(dev_name(&adev->dev), GFP_KERNEL);
> > +     if (!regionid)
> > +             goto exit;
> > +
> > +     list_for_each_entry(rentry, &resource_list, node) {
> > +             struct resource *res =3D rentry->res;
> > +             struct resource *r;
> > +
> > +             /* Skip disabled and invalid resources. */
> > +             if ((res->flags & IORESOURCE_DISABLED) || res->end < res-=
>start)
> > +                     continue;
>
> > +             if (res->flags & IORESOURCE_IO) {
>
> We have resource_type() helper.

I had considered using it, but then I couldn't convince myself that it
would matter, so I went for simpler code.

> And I believe the direct comparison in this case is better.

You seem to be arguing that it matters after all, so why does it matter?
