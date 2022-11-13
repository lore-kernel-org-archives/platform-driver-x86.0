Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F769C433FE
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Nov 2022 21:42:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233850AbiKMVmb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 13 Nov 2022 16:42:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiKMVma (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Nov 2022 16:42:30 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13CAB10B7B
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Nov 2022 13:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1668375741; bh=+DuNRrQexw2DnmAYEeJ5AdRw3GTXEMW+OSd9txk6W/k=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
        b=NLYmH3gCfUkHArsWEnBx+RUZyLWQsSesNCjjcB1fCfehL3oyFq9U3UO3l7uKp2Bmz
         WtMrDnEQ5TvT0TrWc2Rp3pelxIygS/d+AfzY1NKEytWI9vAXIvIDLqUx7a7mDQA1/X
         cGfplZDm9J49ynSOvs9cjMo9zs5PyBZtQkES2q2TZk4T9lFiIrS8owDk2szDg4seB5
         ORVwhLBGAUq5oGVACyR2rmnzLlEu7s8ClePzQ6AXvOzA+xHDCjE2racGT7HM31ReS2
         +pEYP+omzaC/M49p0JYPlrdaErUiyudjLhfhItTpRmqqNrALzMfe9k88wPBqilCYPQ
         nKpZhZvIgNEAQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from yoga9.fritz.box ([62.225.236.35]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4s0j-1ovhv93apr-001yfa; Sun, 13
 Nov 2022 22:42:20 +0100
Message-ID: <557b5e231fbf0b16cb9bd3c9d62e238770a7a12b.camel@gmx.net>
Subject: Re: [PATCH v2 1/2] platform/x86: wmi: Disambiguate WMI event data
 on some ACPI tables
From:   Philipp Jungkamp <p.jungkamp@gmx.net>
To:     Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
Date:   Sun, 13 Nov 2022 22:42:19 +0100
In-Reply-To: <828b7403-40a2-0da4-6bd2-b2370f05f998@gmx.de>
References: <8d54fbbb-0933-aaea-5f66-bb7807f5506d@redhat.com>
         <20221113121259.14895-1-p.jungkamp@gmx.net>
         <828b7403-40a2-0da4-6bd2-b2370f05f998@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 
MIME-Version: 1.0
X-Provags-ID: V03:K1:uB2w2AGHpOlKSEogwqIRMEJTvGHS1v3tSrmcc0L8S5ml1VuzVog
 z2w6KKNrYx5zZq6OTty91iejsjC9wQUgJ+nl5/qUFlZKHtveu4wOQuFqRoF+XjKyq/yU8sK
 AUIzrqDP9L5V5pAqpGRrQdrmCmdch4pRRhYgkgamkqgmNhh+1Y9LqseOwFZxGA9lp/0d9qC
 aN7K6Z2cIMgyT4S0sKT8g==
UI-OutboundReport: notjunk:1;M01:P0:0Zf2/Wwh3vU=;zR9R4F2mjuX20fZMO2GcF3MBbZf
 vTH+QSNvp7g2iyE4zFTqw6ZTCAA4ZkihjBwmV4Tm2KHXrV/tL0usjExHuPxR4c8yG/PrEw5jz
 zIswChKlXOuwAI162FYvsdnrZK0jAMDuaFGV+3IpoJok/rL9vNJLL5/zd5zhHnxJu+0IN3oKl
 BFsrNwpYSTvtUTWwQAgDILzPpSBOjCy29XY4o7AZjTPRJpt/4FqbtdVrv/eol+isqFOf4niJC
 DehMRlehQF+XA6M55uz32qwkT9T46RGE1LY6845WL79CLgmB23fZf5BNIl2Zk1kaPBJyzN3zA
 mItoIx7RYZZs7gTZNWAJzf3nyw+zzfmWyAjX8zl1Sv9TQ0k5i46pVuaLyr+BSwDNSndxNI4FB
 unqfJfqMdCjrE8rftoAosJhuwxbmpn09JEqvwyOWI++JaMDcWb4DzdXWEhSoh+rwnSdIadxrz
 0ZHeQa++dy+yhK8NBspzv/iPhNvzXK3lq+We3yKizpwKpYVl+OmakmpD5FhapKWhuEG5xHwur
 I6VZls/GLBl7jjmCn+CT8iLGIaVHmLZ3SF0K15HaGAB9pP5Qg9yZ8FK+RamZz6HCPxjP6K8wZ
 q9E5Ik544nsoxA5okJUxeMVE/W4fYF5LTioKqX8MOdUbf9NAQCIle3vNgkqaNYXxiKUSs/9N4
 dflCtBVPvPIPO8+08GHVSxjlUbAo2rfExg15nLCKORtp/OD8fqzRgvkxEv2FEl3uZaJN50tJ5
 mMyDHgYuPKwnY55Kv7mJ8wfgbnP1hsBg1myhxqXO27YwC7mWGsZYmqGv5DJsYl8ScyDBIMa88
 pFYL08OyYtM9ibS7/vDraDIjwEYYMj8tolt58QxssbwZdbhYtFSVUbN14kahe09IWYz/Dp8eM
 zYu7fH8EfNSkvcQbk0iZrG8lrIHIP2aZSsh3s4us5sjmmK6n2XLFSxQUGjGiTN9TJHFeJecuk
 cvMVb7hNkX6jtPX4sKfbZ5eJumk=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, 2022-11-13 at 21:30 +0100, Armin Wolf wrote:
> Am 13.11.22 um 13:12 schrieb Philipp Jungkamp:
>=20
> > The ACPI DSDT table includes multiple WMI blocks which emit events
> > with
> > the same notify_id. The wmi_get_event_data() function chooses the
> > wmi_block with the _WED handler to call based on the notify_id.
> > This
> > function may call the wrong _WED event handler based on the order
> > the
> > WMI blocks are parsed.
> >=20
> > This introduces wmi_get_event_data_with_guid() to diambiguate the
> > _WED
> > call to get metadata for an event. The GUID here is the one of the
> > containing WMI block, not the one of the WMI event itself.
>=20
> Hello,
>=20
> maybe it would be better to instead rewrite the driver to utilize the
> WMI bus infrastructure?
> Because a GUID is not guaranteed to be unique inside a system, there
> would still be a chance
> to call the wrong _WED handler.
> AFAIK only utilizing the WMI bus infrastructure would fully
> disambiguate the WMI event data.
>=20
> Armin Wolf
>=20
Hello,

I thought the same, so I implemented the bare minimum to support the
GUID on my hardware using the WMI bus in the v1 patch.

But I also agree with Hans in that it should probably reside in the
ideapad-laptop driver, so there aren't two modules for the same
hardware.

Therefore I'd need to change the WMI handling part of ideapad-laptop in
a way that does not break other hardware.

I don't know how to write a driver which connects on two buses.
The driver is currently for a platform device with the corresponding
probe and remove hooks. How would I coordinate the private data
allocation/deletion between the  platform-probe/-remove and wmi-probe/-
remove in a way that is established by other drivers.

Do you have a recommendation on how to setup a module to register on
two buses or another driver that is good to learn from?

Greetings,
Philipp Jungkamp

> > Signed-off-by: Philipp Jungkamp <p.jungkamp@gmx.net>
> > ---
> > Was separating this change into it's own commit correct?
> >=20
> > =C2=A0 drivers/platform/x86/wmi.c | 30 ++++++++++++++++++++++++++++++
> > =C2=A0 include/linux/acpi.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 3 +++
> > =C2=A0 2 files changed, 33 insertions(+)
> >=20
> > diff --git a/drivers/platform/x86/wmi.c
> > b/drivers/platform/x86/wmi.c
> > index 223550a10d4d..56b666f4b40b 100644
> > --- a/drivers/platform/x86/wmi.c
> > +++ b/drivers/platform/x86/wmi.c
> > @@ -659,6 +659,36 @@ acpi_status wmi_get_event_data(u32 event,
> > struct acpi_buffer *out)
> > =C2=A0 }
> > =C2=A0 EXPORT_SYMBOL_GPL(wmi_get_event_data);
> >=20
> > +/**
> > + * wmi_get_event_data_with_guid - Get WMI data associated with an
> > event by guid
> > + *
> > + * Consider using this instead of wmi_get_event_data() when the
> > notify_id
> > + * of the WMI event may not be unique among all WMI blocks of a
> > device.
> > + *
> > + * @guid: GUID of the WMI block for this event
> > + * @event: Event to find
> > + * @out: Buffer to hold event data. out->pointer should be freed
> > with kfree()
> > + *
> > + * Returns extra data associated with an event in WMI.
> > + */
> > +acpi_status wmi_get_event_data_with_guid(const char *guid, u32
> > event, struct acpi_buffer *out)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct wmi_block *wblock =3D=
 NULL;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct guid_block *gblock;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0acpi_status status;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D find_guid(guid, &=
wblock);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ACPI_FAILURE(status))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return AE_NOT_FOUND;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gblock =3D &wblock->gblock;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((gblock->flags & ACPI_WM=
I_EVENT) && gblock->notify_id
> > =3D=3D event)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return get_event_data(wblock, out);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return AE_NOT_FOUND;
> > +}
> > +EXPORT_SYMBOL_GPL(wmi_get_event_data_with_guid);
> > +
> > =C2=A0 /**
> > =C2=A0=C2=A0 * wmi_has_guid - Check if a GUID is available
> > =C2=A0=C2=A0 * @guid_string: 36 char string of the form fa50ff2b-f2e8-4=
5de-
> > 83fa-65417f2f49ba
> > diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> > index 3015235d65e3..51ac4d6bcae1 100644
> > --- a/include/linux/acpi.h
> > +++ b/include/linux/acpi.h
> > @@ -423,6 +423,9 @@ extern acpi_status wmi_set_block(const char
> > *guid, u8 instance,
> > =C2=A0 extern acpi_status wmi_install_notify_handler(const char *guid,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0wmi_notify_handler handler,
> > void *data);
> > =C2=A0 extern acpi_status wmi_remove_notify_handler(const char *guid);
> > +extern acpi_status wmi_get_event_data_with_guid(const char *guid,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 event,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct acpi_=
buffer
> > *out);
> > =C2=A0 extern acpi_status wmi_get_event_data(u32 event, struct
> > acpi_buffer *out);
> > =C2=A0 extern bool wmi_has_guid(const char *guid);
> > =C2=A0 extern char *wmi_get_acpi_device_uid(const char *guid);
> > --
> > 2.38.1
> >=20

