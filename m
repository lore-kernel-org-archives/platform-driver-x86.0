Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954827;
	b=kDsLEPnAZEgAYJqfk802B2OwNf6tEeIE7IWT2wLrPcCjbITmKz0v5tW0bvuKY2gogYRP
	 YP5hrGrImE0H10x/WheZWGK6SIsV1ZRWbt9Idg5XBJ2dfhUxOAh83+HZRS6IM5QQ6g0f5
	 cxXVREDJ2AuAW1AfUh2Aa6Dsaq3KAb7x4uvKu8Y6Hb1DcQTgJ9WVFdUBHX5eQe8Dc4otD
	 LVoBD8GjBeHRsaXsO6QUBTXwS7R2mJ9QBq58qp+msWtaEPNPaPH++ki4pdyUeKSBiyrMO
	 zDn0FtXblEgYzzWo60Lq37FoXkmOep0Ko6nH1Be0kZcjuVtJc6D2386JPR6e6MsU6ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954827;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=eEh+NFvf3dfHmWpSq1NVWb1dZK08XL1af+slj7PMhJk=;
	b=rraj1NqjEvGXy6joDXao63sE0fXh7qq+ylznft/dcR1nowpHdDwoD9+FLe5S2rzTJzXW
	 9Rnrotob9e3BoNyJw0fAxrmwW2qyu1ZCT62hnsgCJ0k+iJL7btrS4N02GWzOHY6l6u3PU
	 hnx8GvN/sL4Kis0EG/vxo7zqFbRQFhCh860aAB1h8p9ZJeuBBM4TO+G4Kq7dz5i6PiMEZ
	 4KVof/lEhPjpjqSfv7cf56uSL9X3ffOhpcsoTw0NeOEuMJKC7pXKd6aD43yF+FL+j9soL
	 9YujVT02Swqnv3pkeG0cB5bhTyvgEMCM61DNLlrSkIxwEeIzS3zpj8vgFGsriCf71RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b="ld/vC5oR";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WqODdRhL;
	arc=none smtp.remote-ip=103.168.172.147
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07829606A338
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 22:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07829606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=ld/vC5oR;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WqODdRhL
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.phl.internal (Postfix) with ESMTP id 2EB6AEC08F8
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 17:33:45 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Tue, 17 Nov 2026 17:33:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794954823;
	 x=1795041223; bh=eEh+NFvf3dfHmWpSq1NVWb1dZK08XL1af+slj7PMhJk=; b=
	ld/vC5oR/vrIgATY+OVj/qc+Hho5ywu6/tj8+b0Sd+dh8+/TTjOopCad0qpjn9cU
	difKR3oFUWkm9MDhrkcsAVWBaSAAdfVJVhO2P9RZOJXdA3IYaMxeQ4LE5jEjtj9z
	wIokBt+3FJajscUELfSblV++bfxDmymVgKrC9LqcWWXYzJoiKFuPLXQ8rIICTbVq
	ehCwiYEIzINzF+1aHaetbmGGVSFJXmqTevM3G+2ecWuFMh1gkLPlZ7lhAlzNgTS3
	K8FrmLctRNaJpf528I88QvEiAv/cPfsUJdz2wLS2BpXsSPeivqDqM4hpbfj2wrOI
	1aL1cgVEUNzdC8OctvdZnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794954823; x=
	1795041223; bh=eEh+NFvf3dfHmWpSq1NVWb1dZK08XL1af+slj7PMhJk=; b=W
	qODdRhL6M3J/WFuI9+GZLkc9CdY3cWlSWVuAd/6HIvXY8NSGC1+WuFVP37esZ9OP
	i5XlW8akJR8hfbW4x17JqBwOcLy79sp/ZnupH88ZJzosim5c29wJ4jl2WypRM0Gw
	9I5hDMcOWuqFtO5OQd0DqmjCYRYHfxLvEbusp9hBn3YV8y5L5CLGRodCkjrHJAGF
	vYjVxyiutqApKs66rDz+xWFfc7M5cy6ERCLVY1M0XPbuuPoiJLncZZZv8SCpwzEG
	ih1vblNTID0hWu50ay72FiMg//0cXChI9brU+h8SiX4SqVnLI9k3+pUQ59u5hTIl
	eoNx/wkBLX0aWsxQOHuyA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794954823; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:HnsHWXkyturu1hys8h39v3paxoEVR5PloQ2mwE3mIXLBDhX
	UVn6cXJqyyrKWpDiWNq0QBZgU+sRynjT7CB5FM8rmTobsKLn2xWPrDAwFxHcV20z
	q+nA0rz8fphuk3iPzCAJP0ecaNxUeHlxQc+KWKIH97ByCwd+SEcqDOVzwTL/UXGo
	G6FgaovsV7bxPEIBcFfP3lk0tLTcW0On4cO3GK9l4tBA3bsGovTc5HNiaAxswD0S
	fdMc33JtvCRQD5Y9ZD6bl1mtxTV1Vs9iUWya6Sxfw9ZhyVjtwe0RMfoxtRgaiEfY
	gjR8LJAHBBPM5+jZ17wMG0FP4qIhHfIy5+ypX2Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:/29E0rMkG6QwwJB0Vo96j/CR2HEK+fR97AUEyxTSEwc=:Q8wyGNlXH66pl9Z5IrPyKgTgBPJnp2vG20gMvyhrZzU=;
X-ME-Sender: <xms:Rtb8arsZt_0gMfygLeM2KJHqkSL1acjfPYDmH9mofJXmuP1YQY6m-Q>
    <xme:Rtb8anTKBkaQbI52Qjzdqtfck-Tw63oHD8EmgPiiVMXBW5sVEjRlq7tD5sjeV0vYe
    O17bImMTQf2oBddMGZ621WigfkyYutGMETiqWB7rhET75-fbTvhtomu>
X-ME-Proxy-Cause: dmFkZTE/yjuYLIFSQFeRg1BnSUnw8LIJEaMzScgnhP/RSNnRjGPYPdeDiiZFiDCSHCzjXy
    BsodOHwxFxYmGw/DuEfxbFJs2h75U5KRZQtbSGPEoEypYar5BRoJy6MY4Ir98sSD8q1dBR
    7ywSDlTEdYU+xe4GW7KN3i2Cw58lKBBbWZwgFLNWoWtsaqvyErmtC3U6PS0KJgdcNd55Fy
    HcKySEcds8r+jIbdPlO8BILImOHdqvXJmZpquS/V3mboWk0zJTsJSORh45On/ns/D47Dpf
    q1FJVIJ6r1lIDHcgsI1kBqGvRI83o8/vlIFNLNVKAzcw0roEGYY055MPFgTURqbjyODqfU
    l5j/2cwCLwOf7ymZMtwNQclUipiagyp9lolCjecibymIKezmjBWbOomWiSXU+4EDF11qHZ
    JJZQndJZkhb32j8qTc7FQLgWrdeQaK0mcnA43mT5aRYRyKmtAm+5nUQwJoUEh2vtxnzoi1
    KLA7X1TbxeRgcvzzYST8EjCqO1U3ToXmwdIDg2lkboCUFlMGYtVbcC1D2UJ7QzwI0w8sv1
    1oNUMIjWBjritgDy57fRS1lXyjAXipBU4kwSHZ2yZUNv+HIbBRM2HL0i6m8BftcHrwUuaV
    X5r1xI9SCSy5pI+YL4/HK2i/hKSv9cKsexQmCHHaZ44n2K3mI49dMel+ZY8w
X-ME-Proxy: <xmx:Rtb8aqS9vTp5QO_5m9fOSyefaO5l0w-YUK2kj0qqpAiLwPrU-BtqAw>
    <xmx:Rtb8an8nzUj5y-cGyndhfEM-U4walkrBbz9L9a6D-zHYzjZrFZJmnA>
    <xmx:Rtb8ajatZGWXetH72qEd4UujcNjEIPB7HC6l0_5PCnun7px1oSGqYA>
    <xmx:Rtb8agrKvINc-IIPmvqKNeEhU_J-S-Jj9ZnF9CCHGn3D4p3s-u1-4A>
    <xmx:R9b8as5hMG8vihJsErFQLcUyb5BFJMJ6Tzhj50FRYtgMbE5tUju-SdQm>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id A79F92C00085; Tue, 17 Nov 2026 17:33:42 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AZf8LQYQVgsF
Date: Tue, 17 Nov 2026 17:33:22 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Gergo Koteles" <soyer@irl.hu>, "Ike Panhc" <ikepanhc@gmail.com>,
 "Andrew Kallmeyer" <kallmeyeras@gmail.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "Mahir Faisal" <mahirfaisalantiq33@gmail.com>
Message-Id: <e6d2efbc-7ea0-4115-bfb7-c2731dabb62d@app.fastmail.com>
In-Reply-To: <55377800b9338b153d776ab8728a557f682a234a.camel@rong.moe>
References: <20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe>
 <20261116-ymc-82yl-v1-4-fac1a2b01a84@rong.moe>
 <e39bd69c-9953-4154-8938-313e6fb0b26a@app.fastmail.com>
 <55377800b9338b153d776ab8728a557f682a234a.camel@rong.moe>
Subject: Re: [PATCH 4/7] platform/x86: lenovo-ymc: Modernize WMI driver and factor out
 events
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Mon, Nov 16, 2026, at 11:51 AM, Rong Zhang wrote:
> Hi Mark,
>
> On Sun, 2026-11-15 at 17:39 -0500, Mark Pearson wrote:
>>=20
>> On Sun, Nov 15, 2026, at 2:27 PM, Rong Zhang wrote:
>> > The lenovo-ymc driver is a legacy WMI driver. It binds to the events
>> > GUID as a WMI driver but calls the query GUID with the deprecated G=
UID-
>> > based interface.
>> >=20
>> > Handle YMC events in lenovo-wmi-event, and coordinate relevant driv=
ers
>> > with notifier chains:
>> >=20
>> >                 +---LWMI_EVENT_THERMAL_MODE---> wmi-gamezone
>> >                 |
>> >   wmi-events ---+
>> >                 |
>> >                 +---LWMI_EVENT_YMC---> ymc=20
>> > ---IDEAPAD_LAPTOP_YMC_EVENT---> ideapad-laptop
>> >=20
>> > Modernize the lenovo-ymc driver by adopting lwmi_dev_evaluate_int()=
 from
>> > lenovo-wmi-helpers, which has adopted the modern WMI core interface=
s and
>> > taken care of buffer's lifecycle. This should hopefully improve
>> > robustness on various firmware as it aligns with the Windows behavi=
or
>> > that ACPI object type doesn't matter but the size does.
>> >=20
>> > Note that the WMI core does not verify min_event_size for the legacy
>> > notify() callback (it only ensures the event has data). By factorin=
g out
>> > YMC events to lenovo-wmi-events with the new notify_new() callback,=
 now
>> > the WMI core can finally verify the size of event data:
>> >=20
>> >   [WmiDataId(1), read, Description("Lenovo Yoga Mode Change Event")=
]=20
>> > uint32 ModeDataVal;
>> >=20
>> > With these changes, the lenovo-ymc driver become a no_singleton
>> > asynchronous-probe driver that only binds to the query GUID. It also
>> > retrieve event data as a fallback data source when the query method
>>=20
>> Minor typo: retrieves?
>
> Will fix it, thanks.
>
>>=20
>> > fails, so that the EC is always triggered on valid events (i.e., pa=
ssing
>> > the min_event_size check). On probe it's always triggered, too, as =
we
>> > want the EC to initialize the state of keyboard and touchpad on boo=
t.
>> >=20
>> > The input device's phys string also adopts the query GUID rather th=
an
>> > the events one. It shouldn't break anything, as nothing actually ma=
tches
>> > the previous phys string.
>> >=20
>> > The DMI quirk tables are left untouched, as the contained devices s=
hould
>> > have both GUIDs.
>> >=20
>> > Signed-off-by: Rong Zhang <i@rong.moe>
>> > ---
>> >  drivers/platform/x86/lenovo/Kconfig      |  2 +
>> >  drivers/platform/x86/lenovo/wmi-events.c |  7 +++
>> >  drivers/platform/x86/lenovo/wmi-events.h |  1 +
>> >  drivers/platform/x86/lenovo/ymc.c        | 85 ++++++++++++++++++--=
------------
>> >  4 files changed, 58 insertions(+), 37 deletions(-)
>> >=20
>> > diff --git a/drivers/platform/x86/lenovo/Kconfig=20
>> > b/drivers/platform/x86/lenovo/Kconfig
>> > index 516594993073..f16b09bab082 100644
>> > --- a/drivers/platform/x86/lenovo/Kconfig
>> > +++ b/drivers/platform/x86/lenovo/Kconfig
>> > @@ -63,6 +63,8 @@ config LENOVO_YMC
>> >  	depends on INPUT
>> >  	depends on IDEAPAD_LAPTOP
>> >  	select INPUT_SPARSEKMAP
>> > +	select LENOVO_WMI_EVENTS
>> > +	select LENOVO_WMI_HELPERS
>> >  	help
>> >  	  This driver maps the Tablet Mode Control switch to SW_TABLET_MO=
DE=20
>> > input
>> >  	  events for Lenovo Yoga notebooks.
>> > diff --git a/drivers/platform/x86/lenovo/wmi-events.c=20
>> > b/drivers/platform/x86/lenovo/wmi-events.c
>> > index 01ad5bcf0437..a0ddea01213f 100644
>> > --- a/drivers/platform/x86/lenovo/wmi-events.c
>> > +++ b/drivers/platform/x86/lenovo/wmi-events.c
>> > @@ -21,6 +21,7 @@
>> >  #include "wmi-helpers.h"
>> >=20
>> >  #define THERMAL_MODE_EVENT_GUID "D320289E-8FEA-41E0-86F9-911D83151=
B5F"
>> > +#define YOGA_MODE_CHANGE_EVENT_GUID "06129D99-6083-4164-81AD-F092F=
9D773A6"
>> >=20
>> >  #define LWMI_EVENT_DEVICE(guid, type)                        \
>> >  	.guid_string =3D (guid), .context =3D &(enum lwmi_events_type) \
>> > @@ -123,6 +124,7 @@ static void lwmi_events_notify(struct wmi_devic=
e=20
>> > *wdev, const struct wmi_buffer
>> >  	struct lwmi_events_priv *priv =3D dev_get_drvdata(&wdev->dev);
>> >  	void *notif_data =3D NULL;
>> >  	int sel_prof;
>> > +	u32 ymc_mode;
>> >  	int ret;
>> >=20
>> >  	switch (priv->type) {
>> > @@ -143,6 +145,10 @@ static void lwmi_events_notify(struct wmi_devi=
ce=20
>> > *wdev, const struct wmi_buffer
>> >  			return;
>> >  		}
>> >  		break;
>> > +	case LWMI_EVENT_YOGA_MODE_CHANGE:
>> > +		ymc_mode =3D le32_to_cpup(buf->data);
>> > +		notif_data =3D &ymc_mode;
>> > +		break;
>> >  	default:
>> >  		return;
>> >  	}
>> > @@ -175,6 +181,7 @@ static int lwmi_events_probe(struct wmi_device=20
>> > *wdev, const void *context)
>> >=20
>> >  static const struct wmi_device_id lwmi_events_id_table[] =3D {
>> >  	{ LWMI_EVENT_DEVICE(THERMAL_MODE_EVENT_GUID, LWMI_EVENT_THERMAL_M=
ODE)=20
>> > },
>> > +	{ LWMI_EVENT_DEVICE(YOGA_MODE_CHANGE_EVENT_GUID,=20
>> > LWMI_EVENT_YOGA_MODE_CHANGE) },
>> >  	{}
>> >  };
>> >=20
>> > diff --git a/drivers/platform/x86/lenovo/wmi-events.h=20
>> > b/drivers/platform/x86/lenovo/wmi-events.h
>> > index cd34e886912c..592da08ff2a3 100644
>> > --- a/drivers/platform/x86/lenovo/wmi-events.h
>> > +++ b/drivers/platform/x86/lenovo/wmi-events.h
>> > @@ -10,6 +10,7 @@ struct notifier_block;
>> >=20
>> >  enum lwmi_events_type {
>> >  	LWMI_EVENT_THERMAL_MODE =3D 1,
>> > +	LWMI_EVENT_YOGA_MODE_CHANGE =3D 2,
>> >  };
>> >=20
>> >  int lwmi_events_register_notifier(struct notifier_block *nb);
>> > diff --git a/drivers/platform/x86/lenovo/ymc.c=20
>> > b/drivers/platform/x86/lenovo/ymc.c
>> > index eba22600161e..cb3ae49dfd9e 100644
>> > --- a/drivers/platform/x86/lenovo/ymc.c
>> > +++ b/drivers/platform/x86/lenovo/ymc.c
>> > @@ -3,22 +3,25 @@
>> >   * lenovo-ymc.c - Lenovo Yoga Mode Control driver
>> >   *
>> >   * Copyright =C2=A9 2022 Gergo Koteles <soyer@irl.hu>
>> > + * Copyright =C2=A9 2026 Rong Zhang <i@rong.moe>
>> >   */
>> >=20
>> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> >=20
>> > -#include <linux/acpi.h>
>> >  #include <linux/bitfield.h>
>> >  #include <linux/bits.h>
>> >  #include <linux/cleanup.h>
>> > +#include <linux/container_of.h>
>> >  #include <linux/dmi.h>
>> >  #include <linux/input.h>
>> >  #include <linux/input/sparse-keymap.h>
>> >  #include <linux/mutex.h>
>> > +#include <linux/notifier.h>
>> >  #include <linux/wmi.h>
>> >  #include "ideapad-laptop.h"
>> > +#include "wmi-events.h"
>> > +#include "wmi-helpers.h"
>> >=20
>> > -#define LENOVO_YMC_EVENT_GUID	"06129D99-6083-4164-81AD-F092F9D773A=
6"
>> >  #define LENOVO_YMC_QUERY_GUID	"09B0EE6E-C3FD-4243-8DA1-7911FF80BB8=
C"
>> >=20
>> >  #define LENOVO_YMC_QUERY_INSTANCE 0
>> > @@ -61,8 +64,10 @@ static const struct dmi_system_id=20
>> > allowed_chasis_types_dmi_table[] =3D {
>> >  };
>> >=20
>> >  struct lenovo_ymc_private {
>> > +	struct wmi_device *wdev;
>> >  	struct input_dev *input_dev;
>> >  	struct mutex mutex; /* Protects event handling. */
>> > +	struct notifier_block nb;
>> >  };
>> >=20
>> >  static const struct key_entry lenovo_ymc_keymap[] =3D {
>> > @@ -75,49 +80,44 @@ static const struct key_entry lenovo_ymc_keymap=
[] =3D {
>> >  	{ KE_END },
>> >  };
>> >=20
>> > -static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_=
object *data)
>> > +static void lenovo_ymc_refresh(struct lenovo_ymc_private *priv, u3=
2 code)
>> >  {
>> > -	struct lenovo_ymc_private *priv =3D dev_get_drvdata(&wdev->dev);
>> > -	u32 input_val =3D 0;
>> > -	struct acpi_buffer input =3D { sizeof(input_val), &input_val };
>> > -	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
>> > -	union acpi_object *obj;
>> > -	acpi_status status;
>> > -	int code;
>> > +	struct wmi_device *wdev =3D priv->wdev;
>> > +	u32 input =3D 0, output;
>> > +	int ret;
>> >=20
>> >  	guard(mutex)(&priv->mutex);
>> >=20
>> > -	status =3D wmi_evaluate_method(LENOVO_YMC_QUERY_GUID,
>> > -				LENOVO_YMC_QUERY_INSTANCE,
>> > -				LENOVO_YMC_QUERY_METHOD,
>> > -				&input, &output);
>> > -
>> > -	if (ACPI_FAILURE(status)) {
>> > -		dev_warn(&wdev->dev,
>> > -			"Failed to evaluate query method: %s\n",
>> > -			acpi_format_exception(status));
>> > -		return;
>> > -	}
>> > -
>> > -	obj =3D output.pointer;
>> > -
>> > -	if (obj->type !=3D ACPI_TYPE_INTEGER) {
>> > -		dev_warn(&wdev->dev,
>> > -			"WMI event data is not an integer\n");
>> > -		goto free_obj;
>> > -	}
>> > +	ret =3D lwmi_dev_evaluate_int(wdev, LENOVO_YMC_QUERY_INSTANCE,=20
>> > LENOVO_YMC_QUERY_METHOD,
>> > +				    (unsigned char *)&input, sizeof(input), &output);
>> > +	if (ret)
>> > +		dev_warn(&wdev->dev, "Failed to invoke query method: %d\n", ret);
>>=20
>> Should it not bomb out here? Otherwise the chances are high it's repo=
rting an incorrect status isn't it?
>
> It's intentional to fall back to the `code' passed by the argument:
>
> - On probe, fall back to YMC_POSTURE_UNKNOWN
>   - sparse_keymap_report_event() becomes a no-op
>   - trigger the EC to ensure the keyboard and touchpad are enabled=C2=A0
>     (PATCH=C2=A06), or else the user may be unable to input anything
> - On resume (PATCH 5), same as above
> - On event, fall back to the event data
>   - the event carries data as per the MOF (see below)
>   - the WMI core has verified that the event has 4-byte-or-more data
>   - if the event data is correct, everything is fine
>   - if the event data is bogus, it's probably either YMC_POSTURE_UNKNO=
WN
>     (0) or an undefined value (>4). In either case, trigger the EC to
>     ensure the keyboard and touchpad are enabled for the same reason
>
> The MOF of the relevant WMI devices:
>
>    [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
> Description("Lenovo Yoga Mode Change Event"),=20
> guid("{06129D99-6083-4164-81AD-F092F9D773A6}")]
>    class LENOVO_GSENSOR_EVENT : WMIEvent {
>      [key, read] String InstanceName;
>      [read] Boolean Active;
>      [WmiDataId(1), read, Description("Lenovo Yoga Mode Change Event")=
]=20
> uint32 ModeDataVal;
>    };
>  =20
>    [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
> Description("LENOVO_GSENSOR_DATA class"),=20
> guid("{09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C}")]
>    class LENOVO_GSENSOR_DATA {
>      [key, read] String InstanceName;
>      [read] Boolean Active;
>  =20
>      [WmiMethodId(1), Implemented, Description("Mode Data")] void=20
> GetUsageMode([out, Description("Mode Data")] uint32 Data);
>      [WmiMethodId(2..7), DON'T CARE, USUALLY UNIMPLEMENTED]
>    };
>
> If I were the original author of lenovo-ymc, I would not call
> GetUsageMode() on events, but would solely rely on the event data
> (ModeDataVal).
>
> I believe the driver was implemented in the opposite way (i.e., calling
> GetUsageMode() in events and ignore event data) simply because this was
> how https://github.com/lukas-w/yoga-usage-mode was implemented. It was
> more like a preference of the original author rather than a technical
> issue.
>
> I preserved the call to GetUsageMode() simply because I didn't want to=
 be
> too radical here. Prioritizing GetUsageMode() results and falling back=
 to
> event data on failure seems safe anyway.
>
> Does this make sense to you now? Maybe I should've elaborated more in =
the
> commit message...
>
> OTOH, if you don't like the fallback, I can ignore event data (again) =
and
> pass YMC_POSTURE_UNKNOWN to ideapad-laptop on error (IMO we need to
> trigger the EC anyway to enable keyboard and touchpad anyway if we can=
't
> trust event data).
>
Thanks for the explainer - all good.

With that:
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark

