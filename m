Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794848228;
	b=IOOr0BiDeG8zmSlRFZrgT2LW5HLjkHnCrUaFRvfQZpxJnl+0FQFLoMuMseEY8YLLseIw
	 cckfWfbd6IIhaPhM5pmpbgyVr4OvQN0Gwzwx2TvBE+GpaiuUqXXlcX4Jqozz7Az4A0nTP
	 g9aivoFa/2Bhqik7SYsjLjsUsrvEWlcO7RJE2g3zxxE2L6HY+MpBQpbia0Vrgl78YVvbF
	 kVhSljq9WXGtejl9OoGdcPJJLBE6Ls7Ua8c8HS6X5qSUXrGR34Az2jLnzmSBc0+5XBfmC
	 m0N+K0JGHKKyXv4TDcIoA2KBPlvPX5gxDXAOp+nGDZSojazTIOAGE6p4yjrKUtH01WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848228;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=ouCNsR+WwLDuhK9RvPqp1Ov/GO0hUaDrGljDxxiO3gQ=;
	b=oGIj9p5oR2usZKSihaqk7Yp//wyK5QowX5cPQItZFQSTOqUIZ+xIGgUOMiN4L6+OWb4F
	 E/dmnL+RhKkOgP8n1xJK4DOGWnsiolXvHqyG/biuRGUeXWVbNkkdkFRNNH6Mlxdvoex97
	 AJ92CmmITwimxBcK78ZqPehgYYBABRl0QfjmqMltM1KI1hHuyZEqn43Q6RqjX+pBt8hy8
	 YVj7wfpb2IXtqRErkKCT0twRF4rBur9hcRGAplH4YDkIMAms6mF8QjyFWhq1XyDRvwlVZ
	 F6fYowyJeEzCH4mQxXGtiA8rCnefIYUFzXYW4nTEb/LiyQQvXRkxwhLuH7FzfMFFaXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=IaYhVNEU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8684C606A31C;
	Mon, 16 Nov 2026 16:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8684C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=IaYhVNEU
ARC-Seal: i=1; a=rsa-sha256; t=1794848213; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A3x+VpUfpEvE+VBkeHX6z8A2oEOTbUtbqNOPCx61rIjH2sbPmVqH8wqQ2MKN/Q9djGAGCSw4AlTBGxXSrDInj2crPbr2hRc0hTdI5w/6Okvkgx65NX+mG97akNSFH4Y9p3PkefiU04AwVMDnd3o+Y/BsksuoBljjjfc/zx5T3cA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794848213; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ouCNsR+WwLDuhK9RvPqp1Ov/GO0hUaDrGljDxxiO3gQ=; 
	b=cWSEHWozR2SplAYt0GxT1QA4Dk5NyPMNhHaVNFuuHqhx5pcWD6vh1gJktTDbXeRog3l9qJLPeCANjji2aAv0fuItbvvVCc8wElOu2v9OntzM5Mi2Bp8mWJhc5FLTX6fwIN1OLs/MeAkMkubtJUx0t42+ED4rVn5ESeeOUg1x/kw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=IaYhVNEUqhvYvgGbbd8HJcAWnWMJeNZbV3IOMPoHlq2uG0q3ualsIHpXUNIaaPeNkeU51MXXretjcpiKUVqGOpT+ziUQfpeE2fRKO0VrEw1akBNoEQh0C7FYtMVZzRShRR05xTVhrXPXbhO8auG2Zgb819jUucoSjBzJI+tccGJ7l9492hLfpVznHLHo1+C1bnIfxGD9+0e3N0nvqq5jFWUJ1ELJO8g/MbfOQdCBj4HHKeEE6uM0y83c2jTpGMHVNoY5ZHUyi/0lHvr5sFRG51dpHTwohmjSy6dyOmD7K+P7TArooCaZiTpJaaOEqfuCTsKGRFXEvBpBUOUeCqQvrg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=ouCNsR+WwLDuhK9RvPqp1Ov/GO0hUaDrGljDxxiO3gQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179484821078552.33184183231219;
	Mon, 16 Nov 2026 08:56:50 -0800 (PST)
Message-ID: <55377800b9338b153d776ab8728a557f682a234a.camel@rong.moe>
Subject: Re: [PATCH 4/7] platform/x86: lenovo-ymc: Modernize WMI driver and
 factor out events
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J . Clark"	
 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Gergo Koteles
 <soyer@irl.hu>, Ike Panhc <ikepanhc@gmail.com>, Andrew Kallmeyer	
 <kallmeyeras@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org"
	 <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, Mahir
 Faisal <mahirfaisalantiq33@gmail.com>
In-Reply-To: <e39bd69c-9953-4154-8938-313e6fb0b26a@app.fastmail.com>
References: <20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe>
	 <20261116-ymc-82yl-v1-4-fac1a2b01a84@rong.moe>
	 <e39bd69c-9953-4154-8938-313e6fb0b26a@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 00:51:00 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Mark,

On Sun, 2026-11-15 at 17:39 -0500, Mark Pearson wrote:
>=20
> On Sun, Nov 15, 2026, at 2:27 PM, Rong Zhang wrote:
> > The lenovo-ymc driver is a legacy WMI driver. It binds to the events
> > GUID as a WMI driver but calls the query GUID with the deprecated GUID-
> > based interface.
> >=20
> > Handle YMC events in lenovo-wmi-event, and coordinate relevant drivers
> > with notifier chains:
> >=20
> >                 +---LWMI_EVENT_THERMAL_MODE---> wmi-gamezone
> >                 |
> >   wmi-events ---+
> >                 |
> >                 +---LWMI_EVENT_YMC---> ymc=20
> > ---IDEAPAD_LAPTOP_YMC_EVENT---> ideapad-laptop
> >=20
> > Modernize the lenovo-ymc driver by adopting lwmi_dev_evaluate_int() fro=
m
> > lenovo-wmi-helpers, which has adopted the modern WMI core interfaces an=
d
> > taken care of buffer's lifecycle. This should hopefully improve
> > robustness on various firmware as it aligns with the Windows behavior
> > that ACPI object type doesn't matter but the size does.
> >=20
> > Note that the WMI core does not verify min_event_size for the legacy
> > notify() callback (it only ensures the event has data). By factoring ou=
t
> > YMC events to lenovo-wmi-events with the new notify_new() callback, now
> > the WMI core can finally verify the size of event data:
> >=20
> >   [WmiDataId(1), read, Description("Lenovo Yoga Mode Change Event")]=
=20
> > uint32 ModeDataVal;
> >=20
> > With these changes, the lenovo-ymc driver become a no_singleton
> > asynchronous-probe driver that only binds to the query GUID. It also
> > retrieve event data as a fallback data source when the query method
>=20
> Minor typo: retrieves?

Will fix it, thanks.

>=20
> > fails, so that the EC is always triggered on valid events (i.e., passin=
g
> > the min_event_size check). On probe it's always triggered, too, as we
> > want the EC to initialize the state of keyboard and touchpad on boot.
> >=20
> > The input device's phys string also adopts the query GUID rather than
> > the events one. It shouldn't break anything, as nothing actually matche=
s
> > the previous phys string.
> >=20
> > The DMI quirk tables are left untouched, as the contained devices shoul=
d
> > have both GUIDs.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> >  drivers/platform/x86/lenovo/Kconfig      |  2 +
> >  drivers/platform/x86/lenovo/wmi-events.c |  7 +++
> >  drivers/platform/x86/lenovo/wmi-events.h |  1 +
> >  drivers/platform/x86/lenovo/ymc.c        | 85 ++++++++++++++++++------=
--------
> >  4 files changed, 58 insertions(+), 37 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/Kconfig=20
> > b/drivers/platform/x86/lenovo/Kconfig
> > index 516594993073..f16b09bab082 100644
> > --- a/drivers/platform/x86/lenovo/Kconfig
> > +++ b/drivers/platform/x86/lenovo/Kconfig
> > @@ -63,6 +63,8 @@ config LENOVO_YMC
> >  =09depends on INPUT
> >  =09depends on IDEAPAD_LAPTOP
> >  =09select INPUT_SPARSEKMAP
> > +=09select LENOVO_WMI_EVENTS
> > +=09select LENOVO_WMI_HELPERS
> >  =09help
> >  =09  This driver maps the Tablet Mode Control switch to SW_TABLET_MODE=
=20
> > input
> >  =09  events for Lenovo Yoga notebooks.
> > diff --git a/drivers/platform/x86/lenovo/wmi-events.c=20
> > b/drivers/platform/x86/lenovo/wmi-events.c
> > index 01ad5bcf0437..a0ddea01213f 100644
> > --- a/drivers/platform/x86/lenovo/wmi-events.c
> > +++ b/drivers/platform/x86/lenovo/wmi-events.c
> > @@ -21,6 +21,7 @@
> >  #include "wmi-helpers.h"
> >=20
> >  #define THERMAL_MODE_EVENT_GUID "D320289E-8FEA-41E0-86F9-911D83151B5F"
> > +#define YOGA_MODE_CHANGE_EVENT_GUID "06129D99-6083-4164-81AD-F092F9D77=
3A6"
> >=20
> >  #define LWMI_EVENT_DEVICE(guid, type)                        \
> >  =09.guid_string =3D (guid), .context =3D &(enum lwmi_events_type) \
> > @@ -123,6 +124,7 @@ static void lwmi_events_notify(struct wmi_device=
=20
> > *wdev, const struct wmi_buffer
> >  =09struct lwmi_events_priv *priv =3D dev_get_drvdata(&wdev->dev);
> >  =09void *notif_data =3D NULL;
> >  =09int sel_prof;
> > +=09u32 ymc_mode;
> >  =09int ret;
> >=20
> >  =09switch (priv->type) {
> > @@ -143,6 +145,10 @@ static void lwmi_events_notify(struct wmi_device=
=20
> > *wdev, const struct wmi_buffer
> >  =09=09=09return;
> >  =09=09}
> >  =09=09break;
> > +=09case LWMI_EVENT_YOGA_MODE_CHANGE:
> > +=09=09ymc_mode =3D le32_to_cpup(buf->data);
> > +=09=09notif_data =3D &ymc_mode;
> > +=09=09break;
> >  =09default:
> >  =09=09return;
> >  =09}
> > @@ -175,6 +181,7 @@ static int lwmi_events_probe(struct wmi_device=20
> > *wdev, const void *context)
> >=20
> >  static const struct wmi_device_id lwmi_events_id_table[] =3D {
> >  =09{ LWMI_EVENT_DEVICE(THERMAL_MODE_EVENT_GUID, LWMI_EVENT_THERMAL_MOD=
E)=20
> > },
> > +=09{ LWMI_EVENT_DEVICE(YOGA_MODE_CHANGE_EVENT_GUID,=20
> > LWMI_EVENT_YOGA_MODE_CHANGE) },
> >  =09{}
> >  };
> >=20
> > diff --git a/drivers/platform/x86/lenovo/wmi-events.h=20
> > b/drivers/platform/x86/lenovo/wmi-events.h
> > index cd34e886912c..592da08ff2a3 100644
> > --- a/drivers/platform/x86/lenovo/wmi-events.h
> > +++ b/drivers/platform/x86/lenovo/wmi-events.h
> > @@ -10,6 +10,7 @@ struct notifier_block;
> >=20
> >  enum lwmi_events_type {
> >  =09LWMI_EVENT_THERMAL_MODE =3D 1,
> > +=09LWMI_EVENT_YOGA_MODE_CHANGE =3D 2,
> >  };
> >=20
> >  int lwmi_events_register_notifier(struct notifier_block *nb);
> > diff --git a/drivers/platform/x86/lenovo/ymc.c=20
> > b/drivers/platform/x86/lenovo/ymc.c
> > index eba22600161e..cb3ae49dfd9e 100644
> > --- a/drivers/platform/x86/lenovo/ymc.c
> > +++ b/drivers/platform/x86/lenovo/ymc.c
> > @@ -3,22 +3,25 @@
> >   * lenovo-ymc.c - Lenovo Yoga Mode Control driver
> >   *
> >   * Copyright =C2=A9 2022 Gergo Koteles <soyer@irl.hu>
> > + * Copyright =C2=A9 2026 Rong Zhang <i@rong.moe>
> >   */
> >=20
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >=20
> > -#include <linux/acpi.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/bits.h>
> >  #include <linux/cleanup.h>
> > +#include <linux/container_of.h>
> >  #include <linux/dmi.h>
> >  #include <linux/input.h>
> >  #include <linux/input/sparse-keymap.h>
> >  #include <linux/mutex.h>
> > +#include <linux/notifier.h>
> >  #include <linux/wmi.h>
> >  #include "ideapad-laptop.h"
> > +#include "wmi-events.h"
> > +#include "wmi-helpers.h"
> >=20
> > -#define LENOVO_YMC_EVENT_GUID=09"06129D99-6083-4164-81AD-F092F9D773A6"
> >  #define LENOVO_YMC_QUERY_GUID=09"09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C"
> >=20
> >  #define LENOVO_YMC_QUERY_INSTANCE 0
> > @@ -61,8 +64,10 @@ static const struct dmi_system_id=20
> > allowed_chasis_types_dmi_table[] =3D {
> >  };
> >=20
> >  struct lenovo_ymc_private {
> > +=09struct wmi_device *wdev;
> >  =09struct input_dev *input_dev;
> >  =09struct mutex mutex; /* Protects event handling. */
> > +=09struct notifier_block nb;
> >  };
> >=20
> >  static const struct key_entry lenovo_ymc_keymap[] =3D {
> > @@ -75,49 +80,44 @@ static const struct key_entry lenovo_ymc_keymap[] =
=3D {
> >  =09{ KE_END },
> >  };
> >=20
> > -static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_obje=
ct *data)
> > +static void lenovo_ymc_refresh(struct lenovo_ymc_private *priv, u32 co=
de)
> >  {
> > -=09struct lenovo_ymc_private *priv =3D dev_get_drvdata(&wdev->dev);
> > -=09u32 input_val =3D 0;
> > -=09struct acpi_buffer input =3D { sizeof(input_val), &input_val };
> > -=09struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> > -=09union acpi_object *obj;
> > -=09acpi_status status;
> > -=09int code;
> > +=09struct wmi_device *wdev =3D priv->wdev;
> > +=09u32 input =3D 0, output;
> > +=09int ret;
> >=20
> >  =09guard(mutex)(&priv->mutex);
> >=20
> > -=09status =3D wmi_evaluate_method(LENOVO_YMC_QUERY_GUID,
> > -=09=09=09=09LENOVO_YMC_QUERY_INSTANCE,
> > -=09=09=09=09LENOVO_YMC_QUERY_METHOD,
> > -=09=09=09=09&input, &output);
> > -
> > -=09if (ACPI_FAILURE(status)) {
> > -=09=09dev_warn(&wdev->dev,
> > -=09=09=09"Failed to evaluate query method: %s\n",
> > -=09=09=09acpi_format_exception(status));
> > -=09=09return;
> > -=09}
> > -
> > -=09obj =3D output.pointer;
> > -
> > -=09if (obj->type !=3D ACPI_TYPE_INTEGER) {
> > -=09=09dev_warn(&wdev->dev,
> > -=09=09=09"WMI event data is not an integer\n");
> > -=09=09goto free_obj;
> > -=09}
> > +=09ret =3D lwmi_dev_evaluate_int(wdev, LENOVO_YMC_QUERY_INSTANCE,=20
> > LENOVO_YMC_QUERY_METHOD,
> > +=09=09=09=09    (unsigned char *)&input, sizeof(input), &output);
> > +=09if (ret)
> > +=09=09dev_warn(&wdev->dev, "Failed to invoke query method: %d\n", ret)=
;
>=20
> Should it not bomb out here? Otherwise the chances are high it's reportin=
g an incorrect status isn't it?

It's intentional to fall back to the `code' passed by the argument:

- On probe, fall back to YMC_POSTURE_UNKNOWN
  - sparse_keymap_report_event() becomes a no-op
  - trigger the EC to ensure the keyboard and touchpad are enabled=C2=A0
    (PATCH=C2=A06), or else the user may be unable to input anything
- On resume (PATCH 5), same as above
- On event, fall back to the event data
  - the event carries data as per the MOF (see below)
  - the WMI core has verified that the event has 4-byte-or-more data
  - if the event data is correct, everything is fine
  - if the event data is bogus, it's probably either YMC_POSTURE_UNKNOWN
    (0) or an undefined value (>4). In either case, trigger the EC to
    ensure the keyboard and touchpad are enabled for the same reason

The MOF of the relevant WMI devices:

   [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Le=
novo Yoga Mode Change Event"), guid("{06129D99-6083-4164-81AD-F092F9D773A6}=
")]
   class LENOVO_GSENSOR_EVENT : WMIEvent {
     [key, read] String InstanceName;
     [read] Boolean Active;
     [WmiDataId(1), read, Description("Lenovo Yoga Mode Change Event")] uin=
t32 ModeDataVal;
   };
  =20
   [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LE=
NOVO_GSENSOR_DATA class"), guid("{09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C}")]
   class LENOVO_GSENSOR_DATA {
     [key, read] String InstanceName;
     [read] Boolean Active;
  =20
     [WmiMethodId(1), Implemented, Description("Mode Data")] void GetUsageM=
ode([out, Description("Mode Data")] uint32 Data);
     [WmiMethodId(2..7), DON'T CARE, USUALLY UNIMPLEMENTED]
   };

If I were the original author of lenovo-ymc, I would not call
GetUsageMode() on events, but would solely rely on the event data
(ModeDataVal).

I believe the driver was implemented in the opposite way (i.e., calling
GetUsageMode() in events and ignore event data) simply because this was
how https://github.com/lukas-w/yoga-usage-mode was implemented. It was
more like a preference of the original author rather than a technical
issue.

I preserved the call to GetUsageMode() simply because I didn't want to be
too radical here. Prioritizing GetUsageMode() results and falling back to
event data on failure seems safe anyway.

Does this make sense to you now? Maybe I should've elaborated more in the
commit message...

OTOH, if you don't like the fallback, I can ignore event data (again) and
pass YMC_POSTURE_UNKNOWN to ideapad-laptop on error (IMO we need to
trigger the EC anyway to enable keyboard and touchpad anyway if we can't
trust event data).

Thanks,
Rong

>=20
> > +=09else
> > +=09=09code =3D output;
> >=20
> >  =09/* strip upper bits (e.g. 0x50000) on newer devices */
> > -=09code =3D FIELD_GET(LENOVO_YMC_STATE_MASK, obj->integer.value);
> > +=09code =3D FIELD_GET(LENOVO_YMC_STATE_MASK, code);
> >=20
> >  =09if (!sparse_keymap_report_event(priv->input_dev, code, 1, true))
> >  =09=09dev_warn(&wdev->dev, "Unknown key %d pressed\n", code);
> >=20
> > -free_obj:
> > -=09kfree(obj);
> >  =09ideapad_laptop_call_notifier(IDEAPAD_LAPTOP_YMC_EVENT, &code);
> >  }
> >=20
> > +static int lenovo_ymc_notify(struct notifier_block *nb, unsigned long=
=20
> > action, void *data)
> > +{
> > +=09struct lenovo_ymc_private *priv =3D container_of(nb, struct=20
> > lenovo_ymc_private, nb);
> > +=09const u32 *p =3D data;
> > +
> > +=09switch (action) {
> > +=09case LWMI_EVENT_YOGA_MODE_CHANGE:
> > +=09=09lenovo_ymc_refresh(priv, *p);
> > +=09=09return NOTIFY_OK;
> > +=09default:
> > +=09=09return NOTIFY_DONE;
> > +=09}
> > +}
> > +
> >  static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
> >  {
> >  =09struct lenovo_ymc_private *priv;
> > @@ -147,7 +147,7 @@ static int lenovo_ymc_probe(struct wmi_device=20
> > *wdev, const void *ctx)
> >  =09=09return err;
> >=20
> >  =09input_dev->name =3D "Lenovo Yoga Tablet Mode Control switch";
> > -=09input_dev->phys =3D LENOVO_YMC_EVENT_GUID "/input0";
> > +=09input_dev->phys =3D LENOVO_YMC_QUERY_GUID "/input0";
> >  =09input_dev->id.bustype =3D BUS_HOST;
> >  =09input_dev->dev.parent =3D &wdev->dev;
> >  =09err =3D sparse_keymap_setup(input_dev, lenovo_ymc_keymap, NULL);
> > @@ -164,16 +164,24 @@ static int lenovo_ymc_probe(struct wmi_device=20
> > *wdev, const void *ctx)
> >  =09=09return err;
> >  =09}
> >=20
> > +=09priv->wdev =3D wdev;
> >  =09priv->input_dev =3D input_dev;
> > +=09priv->nb.notifier_call =3D lenovo_ymc_notify;
> >  =09dev_set_drvdata(&wdev->dev, priv);
> >=20
> > +=09err =3D devm_lwmi_events_register_notifier(&wdev->dev, &priv->nb);
> > +=09if (err) {
> > +=09=09dev_err(&wdev->dev, "Could not register YMC events notifier: %d\=
n", err);
> > +=09=09return err;
> > +=09}
> > +
> >  =09/* Report the state for the first time on probe */
> > -=09lenovo_ymc_notify(wdev, NULL);
> > +=09lenovo_ymc_refresh(priv, YMC_POSTURE_UNKNOWN);
> >  =09return 0;
> >  }
> >=20
> >  static const struct wmi_device_id lenovo_ymc_wmi_id_table[] =3D {
> > -=09{ .guid_string =3D LENOVO_YMC_EVENT_GUID },
> > +=09{ .guid_string =3D LENOVO_YMC_QUERY_GUID },
> >  =09{ }
> >  };
> >  MODULE_DEVICE_TABLE(wmi, lenovo_ymc_wmi_id_table);
> > @@ -181,16 +189,19 @@ MODULE_DEVICE_TABLE(wmi, lenovo_ymc_wmi_id_table)=
;
> >  static struct wmi_driver lenovo_ymc_driver =3D {
> >  =09.driver =3D {
> >  =09=09.name =3D "lenovo-ymc",
> > +=09=09.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> >  =09},
> >  =09.id_table =3D lenovo_ymc_wmi_id_table,
> > -=09.min_event_size =3D sizeof(u32),
> >  =09.probe =3D lenovo_ymc_probe,
> > -=09.notify =3D lenovo_ymc_notify,
> > +=09.no_singleton =3D true,
> >  };
> >=20
> >  module_wmi_driver(lenovo_ymc_driver);
> >=20
> >  MODULE_AUTHOR("Gergo Koteles <soyer@irl.hu>");
> > +MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
> >  MODULE_DESCRIPTION("Lenovo Yoga Mode Control driver");
> >  MODULE_LICENSE("GPL");
> >  MODULE_IMPORT_NS("IDEAPAD_LAPTOP");
> > +MODULE_IMPORT_NS("LENOVO_WMI_EVENTS");
> > +MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
> >=20
> > --=20
> > 2.55.0
