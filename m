Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5849C215164;
	Fri, 10 Jan 2025 22:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736548891; cv=none; b=oMHkd92HjuTSmN/M6bRzm9aFyvG55iaTD9H5MkvxIX9egSLmpqWW72csUC3nkUhd45AY3A753uVm/rr/2nWNiKQkoYvVm8DkQvWGNiVHcsR9qgkVwQLHAgv6zQC+gStAFzAZt2aWp6h1R/TqQGTxyDrXJtX1C6pT2A3SqBBu8Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736548891; c=relaxed/simple;
	bh=tVY1haDtNvDJpp9+FLFLRZawG3isRk/x+Cd40b4vegE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nD/3GDLjPm6BrPDHNvu99LvjoReGOSwajyamAHDF7YUC7vNYYO0i+6yxbkm8wO62WF7z9aDuAQMTGiS+RE27Uiy8YBJqcQZ3a2vU99dVeXMjkYrfSDfuqaqwu+QWfSSGtphG8GnA71w3lxFeZK3nSizL8cEDN8TsVV+Wakh2olw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHTFpZY9; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHTFpZY9"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d92cd1e811so30151226d6.1;
        Fri, 10 Jan 2025 14:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736548888; x=1737153688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hjIfzQbEBpLtDeVHvJJuSWcPqJz4aGl+rnLsdJdNp4=;
        b=iHTFpZY9TuQXiGQhilP/FkadEACrgN9itwzIMo4/X7kxX1bwRI8TcQF29XTJbXhNDD
         VhWTa1uOsaUImyxuazADLtKMOdZIylwH7Q//87Qh9eX+ESivwWoHxdBWfNEdYEfRvuXG
         E9kGdAJC87jlBLrVnZ43v0O+t4+S5Exnbrou2G/vMdmIdv10op15WQ6uu8yWCitUTGfn
         x6EiKpUfgiumHn4U8I+5PLOEttfmU9DC4KieBsFz4oCF0hTKKtZ3GuVBKD7o42u2/17z
         J/EC7+7y9ML6i1Hq/Q+0/0CIdcuz+crxNO82TQf9Ne2f+Dexdfd1uBaCUWHLjjgfU3Tg
         rVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736548888; x=1737153688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hjIfzQbEBpLtDeVHvJJuSWcPqJz4aGl+rnLsdJdNp4=;
        b=s3BVq0cMM+co3wtBVRnHxF1xk56v1KAu5BU3mIN5a7q2vrDI34MXYVOgp+Wlo8CsFr
         KyoWAYTJorzDUnh0hR4rcrzBk7UcJkqq2/UU0fcaSCj/aVnURkXrA5O6pgbVZx8TQQ7P
         7zlB2hygaD/4IgDXiNyuZJ48BNHy9UkiFT9URDpF7VdbFWGQcGXMDIFethJTf6YxoRgT
         OCzE+wJpG+6A3NcusKaVhGNwGoXUcxCyH3rzWSGzBarMuWjuqOxc+GgfieJ+CozdwXVB
         7R0zp2SakN7p9YiABpGtglia3NoL4Gea2gmegZsyO6K40ltHyW6SSvPLP74P89fWLPls
         drqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhbEcbq77qsRuX+6v5WW7MYmp9HCM05I3XuUxXMGxjdUUa5V3Qr9jm2rUup1bG9hETAc4g+G53vG0=@vger.kernel.org, AJvYcCWENDi5NhoC4UTQ462+v3nSsReOznqDeALEwg05W89C7U9zJTfpHW6TOCqLIVo2qnTQxOO7j4AslB0ZK/1W2TJOYqLsCQ==@vger.kernel.org, AJvYcCWzZcRKGVeYgDU1rlnIbnNuIf9c2/rTv/QASPu352RVzp2w0GWpgRLgLWN1Z1LdAOYsY2Pr0d24E1e1FZB0@vger.kernel.org
X-Gm-Message-State: AOJu0YyNs4DVKjbnoR7zb3Yhu1iKY2LDW60AsGIma8hxyJ+lP0xgI5pt
	AleyqhSh2qB/23zs0jug3kQt+ZhMY4qJS9dLDeeQ3AJ+xcNHyD78J+xwE3VsKIMp9MqVWLqVT96
	7Mhw4psuh0/iAH9OCq96vJK6yu/4=
X-Gm-Gg: ASbGncskgy0sKeKhTteerS9RNrgGIcpxEZnpLnKRuxDUyzmsDNS5f9fEIlEMru8Bo+M
	cyt1MK0N/8AByPDKiVwuuS95OeZfGFkwECOTDs4w=
X-Google-Smtp-Source: AGHT+IF2h4w7j8vnUlGAylzLri8akCNuNw8PAkhV5WyZboj4cWBcFLCl769pA5HMpZ1AyejXbKn8bh0FL2dOoLqUDLg=
X-Received: by 2002:a05:6214:438a:b0:6d4:1d7e:bc72 with SMTP id
 6a1803df08f44-6dfbaa09432mr897306d6.12.1736548888078; Fri, 10 Jan 2025
 14:41:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-2-derekjohn.clark@gmail.com> <a568a6b7-64d0-4ac1-86ed-19fd96887241@gmx.de>
In-Reply-To: <a568a6b7-64d0-4ac1-86ed-19fd96887241@gmx.de>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Fri, 10 Jan 2025 14:41:17 -0800
X-Gm-Features: AbW1kvbg0Fe7f0IsKc1ur3VRKRPDXB_8lGMQxOPL7x1zrtA92D3OWJERaWqo9kQ
Message-ID: <CAFqHKTkkchsFOq2oZuuLNNxDuy9i5L-kpcD0+0_9NCNUxLirSA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] platform/x86: Add lenovo-wmi drivers Documentation
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>, 
	Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, "Cody T . -H . Chiu" <codyit@gmail.com>, 
	John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, aichao@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 1:37=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 02.01.25 um 01:47 schrieb Derek J. Clark:
>
> > Adds documentation for all lenovo-wmi* drivers.
>
> Hi,
>
> while i would prefer separate documentation files for each driver, groupi=
ng them together for now
> is also fine. We can split them later should the combined file become to =
big.

I don't have an issue with separating them. Once I add the MOF info
this file will become large.

> >
> > v2:
> > - Update description of Custom Profile to include the need to manually
> >    set it.
> > - Remove all references to Legion hardware.
> > - Add section for lemovo-wmi-camera.c driver as it follows the same
> >    naming convention.
> >
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> >   Documentation/wmi/devices/lenovo-wmi.rst | 104 ++++++++++++++++++++++=
+
> >   1 file changed, 104 insertions(+)
> >   create mode 100644 Documentation/wmi/devices/lenovo-wmi.rst
> >
> > diff --git a/Documentation/wmi/devices/lenovo-wmi.rst b/Documentation/w=
mi/devices/lenovo-wmi.rst
> > new file mode 100644
> > index 000000000000..62c2ec9505bd
> > --- /dev/null
> > +++ b/Documentation/wmi/devices/lenovo-wmi.rst
> > @@ -0,0 +1,104 @@
> > +.. SPDX-License-Identifier: GPL-2.0-or-later
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +Lenovo WMI Interface Drivers (lenovo-wmi)
>
> Since we are talking about multiple drivers, i suggest you change this li=
ne to:
>
>         Lenovo WMI Interface Drivers (lenovo-wmi-*)
>
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +
> > +Introduction
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Lenovo WMI interfaces are broken up into multiple GUIDs, some of which
> > +require cross-references between GUIDs for some functionality. The "Cu=
stom
> > +Mode" interface is a legacy interface for managing and displaying CPU =
& GPU
> > +power and hwmon settings and readings. The "Other Method" interface is=
 a
> > +modern interface that replaces most "Custom Mode" interface methods. T=
he
> > +"GameZone" interface adds advanced features such as fan profiles and
> > +overclocking. The "Lighting" interface adds control of various status
> > +lights related to different hardware components.
> > +
> > +Each interface has a different data structure associated with it that
> > +provides detailed information about each attribute provided by the
> > +interface. These data structs are retrieved from additional WMI device
> > +data block GUIDs:
> > + - "Custom Mode" uses LENOVO_FAN_TABLE_DATA, LENOVO_FAN_TEST_DATA,
> > +   LENOVO_CPU_OVERCLOCKING_DATA, LENOVO_DISCRETE_DATA, and
> > +   LENOVO_GPU_OVERCLOCKING_DATA depending on the feature.
> > + - "Other Method" uses LENOVO_CAPABILITY_DATA_00,
> > +   LENOVO_CAPABILITY_DATA_01, and LENOVO_CAPABILITY_DATA_02 depending =
on
> > +   the feature.
> > + - "GameZone" uses LENOVO_GAMEZONE_CPU_OC_DATA and
> > +   LENOVO_GAMEZONE_GPU_OC_DATA depending on the feature.
> > + - The "Lighting" interface uses LENOVO_LIGHTING_DATA.
> > +
> > +.. note::
> > +   Currently only the "GameZone", "Other Method", and
> > +   LENOVO_CAPABILITY_DATA_01 interfaces are implemented by these drive=
rs.
> > +
> > +GameZone
> > +--------
> > +WMI GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
>
> Please add the MOF of the WMI class here so that future developers know w=
hich methods, etc
> the WMI interface supports.
>

Ack

> > +
> > +The GameZone WMI interface provides platform-profile and fan curve set=
tings
> > +for devices that fall under the "Gaming Series" of Lenovo devices.
> > +
> > +The following platform profiles are supported:
> > + - quiet
> > + - balanced
> > + - performance
> > + - custom
>
> Please add some technical documentation about the WMI methods used by tho=
se functions. You can take a look at
> Documentation/wmi/devices/msi-wmi-platform.rst for inspiration.
>

Ack

> > +
> > +Custom Profile
> > +~~~~~~~~~~~~~~
> > +The custom profile represents a hardware mode on Lenovo devices that e=
nables
> > +user modifications to Package Power Tracking (PPT) settings. When an
> > +attribute exposed by the "Other Method" WMI interface is to be modifie=
d,
> > +the GameZone driver must first be switched to the "custom" profile man=
ually
> > +or the setting will have no effect. If another profile is set from the=
 list
> > +of supported profiles, the BIOS will override any user PPT settings wh=
en
> > +switching to that profile.
> > +
> > +
> > +Other Method
> > +----------
> > +WMI GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
> > +
> > +The Other Method WMI interface uses the fw_attributes class to expose
> > +various WMI attributes provided by the interface in the sysfs. This en=
ables
> > +CPU and GPU power limit tuning as well as various other attributes for
> > +devices that fall under the "Gaming Series" of Lenovo devices. Each
> > +attribute exposed by the Other Method interface has corresponding
> > +capability data blocks which allow the driver to probe details about t=
he
> > +attribute. Each attibute has multiple pages, one for each of the platf=
orm
> > +profiles managed by the "GameZone" interface. For all properties only =
the
> > +"Custom" profile values are reported by this driver to ensure any user=
space
> > +applications reading them have accurate tunable value ranges. Attribut=
es
> > +are exposed in sysfs under the following path:
> > +/sys/class/firmware-attributes/lenovo-wmi-other/attributes
>
> Same as above.
>

Ack

> > +
> > +LENOVO_CAPABILITY_DATA_01
> > +~~~~~~~~~~~~~~~~~~~~~~~~~
> > +WMI GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
> > +
> > +The LENOVO_CAPABILITY_DATA_01 interface provides information on variou=
s
> > +power limits of integrated CPU and GPU components.
> > +
> > +The following attributes are supported:
> > + - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
> > + - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
> > + - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
> > +
> > +Each attribute has the following properties:
> > + - current_value
> > + - default_value
> > + - display_name
> > + - max_value
> > + - min_value
> > + - scalar_increment
> > + - type
> > +
> > +
> > + Camera
> > + ______
>
> I get the following error when trying to build the documentation:
>
>         Sphinx parallel build error:
>         docutils.utils.SystemMessage: /home/wolf/Dokumente/Kernel/platfor=
m-drivers-x86/Documentation/wmi/devices/lenovo-wmi.rst:99: (SEVERE/4) Unexp=
ected section title.
>
> Please fix this.
>
> Also please add some technical details here to. However in this case this=
 is optional since this patch series focuses
> on the Gaming Series drivers.

Since I'm splitting the files I'll drop this one and let Ai Chao (+cc)
take care of that as the module author. I don't have any of the
technical documentation for that interface.

Thanks Armin,
Derek

> Thanks,
> Armin Wolf
>
> > + WMI GUID "50C76F1F-D8E4-D895-0A3D-62F4EA400013"
> > +
> > + The Camera driver provides WMI event notifications for camera button
> > + toggling.
> > +
