From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/4] platform/x86: Add Asus Wireless Radio Control driver
Date: Fri, 18 Dec 2015 23:23:24 -0800
Message-ID: <20151219072324.GF7244@malice.jf.intel.com>
References: <1450193442-7930-1-git-send-email-jprvita@endlessm.com>
 <1450193442-7930-2-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49888 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753171AbbLSHX0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 Dec 2015 02:23:26 -0500
Content-Disposition: inline
In-Reply-To: <1450193442-7930-2-git-send-email-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>, Mousou Yuu <guogaishiwo@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@endlessm.com>

On Tue, Dec 15, 2015 at 10:30:39AM -0500, Jo=E3o Paulo Rechi Vita wrote=
:

=2E..

> +static void asus_wrc_notify(struct acpi_device *device, u32 event)
> +{
> +	struct asus_wrc_data *data =3D acpi_driver_data(device);
> +
> +	pr_debug("event=3D0x%X\n", event);
> +
> +	if (!sparse_keymap_report_event(data->inputdev, event, 1, true))
> +		pr_info("Unknown ASHS event: 0x%X\n", event);
> +}
> +
> +static int asus_wrc_add(struct acpi_device *device)
> +{
> +	struct asus_wrc_data *data;
> +	int err =3D -ENOMEM;
> +
> +	pr_info(ASUS_WRC_MODULE_NAME"\n");
> +
> +	data =3D kzalloc(sizeof(struct asus_wrc_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->inputdev =3D input_allocate_device();
> +	if (!data->inputdev)
> +		goto fail;
> +
> +	data->inputdev->name =3D "Asus Wireless Radio Control";
> +	data->inputdev->phys =3D "asus-wrc/input0";
> +	data->inputdev->id.bustype =3D BUS_HOST;
> +	data->inputdev->dev.parent =3D &device->dev;
> +	set_bit(EV_REP, data->inputdev->evbit);

The version Mousou includes some minor differences:

+	switch_dev->id.vendor =3D PCI_VENDOR_ID_ASUSTEK;

The vendor addition seems appropriate.

The rest appears to be a slightly more directly approach to a sparse ke=
ymap
which seems like overkill for a driver with a single key.

+	set_bit(EV_KEY, switch_dev->evbit);
+	set_bit(KEY_RFKILL, switch_dev->keybit);

Mousou's driver results in about 30 less lines as well. Please compare =
and see
if we might be able to merge the best of each version.

--=20
Darren Hart
Intel Open Source Technology Center
