From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v2] Add driver to force WMI Thunderbolt controller power
 status
Date: Fri, 8 Sep 2017 15:15:10 +0000
Message-ID: <339f06ce8efd42409bf5f91dfd064e7a@ausx13mpc120.AMER.DELL.COM>
References: <1504810042-4696-1-git-send-email-mario.limonciello@dell.com>
 <20170908080729.GT2477@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa6.dell-outbound.iphmx.com ([68.232.149.229]:12519 "EHLO
        esa6.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1756505AbdIHPQJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Sep 2017 11:16:09 -0400
In-Reply-To: <20170908080729.GT2477@lahna.fi.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mika.westerberg@linux.intel.com
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hughsient@gmail.com, yehezkelshb@gmail.com

> -----Original Message-----
> From: Mika Westerberg [mailto:mika.westerberg@linux.intel.com]
> Sent: Friday, September 8, 2017 3:07 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; LKML <linux-kernel@vger.kernel.org>; platform-d=
river-
> x86@vger.kernel.org; Richard Hughes <hughsient@gmail.com>; Yehezkel Berna=
t
> <yehezkelshb@gmail.com>
> Subject: Re: [PATCH v2] Add driver to force WMI Thunderbolt controller po=
wer
> status
>=20
> On Thu, Sep 07, 2017 at 01:47:22PM -0500, Mario Limonciello wrote:
>=20
> I have a small comment which you might want to consider.
>=20
> > +static int intel_wmi_thunderbolt_probe(struct wmi_device *wdev)
> > +{
> > +	return sysfs_create_group(&wdev->dev.kobj, &tbt_attribute_group);
> > +}
> > +
> > +static int intel_wmi_thunderbolt_remove(struct wmi_device *wdev)
> > +{
> > +	sysfs_remove_group(&wdev->dev.kobj, &tbt_attribute_group);
> > +	return 0;
> > +}
>=20
> In order to notify userspace about this, what if you send KOBJ_CHANGE
> for the wdev when you add/remove this attribute?

Sure, makes sense to me.   I'll send a follow up patch.
