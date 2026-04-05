Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456E140DFB7;
	Sun,  5 Apr 2026 00:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775347456; cv=none; b=mDWHtJ6rgPbzliCkI56gWO4nhZNsx6xafYbKbyzQ1wmfpuSLo3O1cHobMzzgppji6Z36h3P+OHq2T+F/fpdf0aOFNicTpvHejf27qDnL3hsZcBjWmzn7qG6dvlkjL5p5fIxSfJtfKqoY+T0kFMrWb47OS/HBd6+1PbO9vBHATPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775347456; c=relaxed/simple;
	bh=05qBqUi1wgYMkikwds/rpw/nu7uGQJsPLYxdqFZ8NwQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QRh6Mu8NCBqcUBw57s0FHO5cXpIAICnzHUF8I+a8WZL3V9RnZRYsmBhKxSwRbb8GOYfIUHyY3UyN4PZDxv9/RnVFvxUBQwpQgJoV/yiP8S1ByGmY7oeuUG7M0iMeHJ1ow3CJ1x6CbsEqlh/PXL3Vs+3EZ27Y9q8xmB0E3dTtCRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=DBkBz7pJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C2AoK14l; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="DBkBz7pJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C2AoK14l"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id E374F1D000CB;
	Sat,  4 Apr 2026 20:04:12 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Sat, 04 Apr 2026 20:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1775347452;
	 x=1775433852; bh=XagppRzShUGHdhY0WZiBJkN4RXxOAphDSrg3oTlGsBM=; b=
	DBkBz7pJTOaPG0x0SsC16nAOH8plhoPPY4+VqLuE4KBn9CYgllHIGGLDVxLKwNrf
	UI9InYwpDi34s0wMKuIkcYFF9qxKCn7kmI/OIMC/rmx9TLW88i5wcENQRktZ0o7w
	I8/fFeZ/t3r3uIEK79BsZLA6lTDMwJ6DxD5z7offxT/pucT9kshNJ91TQBqyHUVI
	aM7011sLdnFmbOQiDBju53jjRolqAmqHjwiJ0l978H24En8zn+xiOlT5cLrJQX4m
	g1l5Db9pewtUVA8NkjkorOc0uNqWRJmicnDqUJu1UllbjkJIpPkKf2af9LAa7nfJ
	4vYaz0A2Sqqc/xEh4y2VEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775347452; x=
	1775433852; bh=XagppRzShUGHdhY0WZiBJkN4RXxOAphDSrg3oTlGsBM=; b=C
	2AoK14lmZUsY6TL8Tylz8yQaWvmY48PrAFQtGDv23v3NZBeUL08erOSmL9AVqcbp
	o76kLv+ZXMgNQnO4Qs5jgAmnfRH1zVN7ahwY0B1T5omN2TtIbz2q9pnDMSr70yqp
	xy2Pi69/OM+Y7gUdGeij3cnZp99Wj8yUtfKmZsIrE/ZHWQvQb7/tgDlGvjSF+JlY
	YjTOYYI9O/y/AJJVQBDefmFBh2rXFoEfHWNn7N64qLTHw3lJHc/GE3a6ThDsWzAq
	nw3iwCljL87AOYvzr9hz56SxfpVhBZyWqTcyNNhAZyHEaTvIgjzmfXdmBV8J/nh/
	kRVhbI80aEVoxiDyFbHVw==
X-ME-Sender: <xms:_KbRaU3MQccNFf6ldKsgps9iNuISaR0KTeafA-P95wj-fyqU7fmbNw>
    <xme:_KbRaZ7-G-0DOT83NmCM9pTtin7i9LJEzPuLmkfuDBOmtI8I67wOYS1YsXVyYuBB6
    g-VzFVesC5Ht_1qow7tphYZ244rBWkok_oITVtfwO4vvMzdiGwkesA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufedvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhephfeuvdehteeghedthedtveehuddvjeejgffgieejvdeg
    kefhfeelheekhedvffehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgs
    pghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvrhgvkh
    hjohhhnhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehkuhhurhhtsges
    ghhmrghilhdrtghomhdprhgtphhtthhopeifpggrrhhmihhnsehgmhigrdguvgdprhgtph
    htthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgr
    rhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheptghorhgsvg
    htsehlfihnrdhnvghtpdhrtghpthhtohepihesrhhonhhgrdhmohgvpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:_KbRab1yVzcLrhWU5lRTAbp9l4zvh1xVQqLZWgQwBPYFd-NJvnbrbw>
    <xmx:_KbRaWqPWUWUipEbMMDG2OTq64AE9W7tvOwpDQFnYEwzXhFvBDpxZw>
    <xmx:_KbRaQWFWZMjtZHJU7xZwovKhAqD-4Bp3A5IRaLKgcpLDvfZ226yQA>
    <xmx:_KbRaXoisVGU0oaTOcTSJ95PgUeWDhCN-PDmLrUdG5bUx84gbJY2lg>
    <xmx:_KbRaY6IzUj5RDYD-iQIA6kpwAIoIbo1HcAyWwHTTBQaByDQAWv3Yh9l>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0E7502CE3F96; Sat,  4 Apr 2026 20:04:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AMBM-yAyqqRN
Date: Sat, 04 Apr 2026 20:03:50 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hansg@kernel.org>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>,
 "Rong Zhang" <i@rong.moe>, "Kurt Borja" <kuurtb@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <ac5a412f-9fb5-4f1a-99ca-127e1564d327@app.fastmail.com>
In-Reply-To: <20260402032424.678528-9-derekjohn.clark@gmail.com>
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
 <20260402032424.678528-9-derekjohn.clark@gmail.com>
Subject: Re: [PATCH v7 08/16] platform/x86: lenovo-wmi-helpers: Move gamezone enums to
 wmi-helpers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Derek,

On Wed, Apr 1, 2026, at 11:24 PM, Derek J. Clark wrote:
> In a later patch in the series the thermal mode enum will be accessed
> across three separate drivers (wmi-capdata, wmi-gamezonem and wmi-other).
> An additional patch in the series will also add a function protoype that
> needs to reference this enum in wmi-helpers.h To avoid having all these
> drivers begin to import each others headers, and to avoid declaring an
> opaque enum to hande the second case, move the thermal mode enum to
> helpers where it can be safely accessed by everything that needs it from
> a single import.
>
> While at it, since the gamezone_events_type enum is the only remaining
> item in the header, move that as well and remove the gamezone header
> entirely.
>
> Reviewed-by: Rong Zhang <i@rong.moe>
> Tested-by: Rong Zhang <i@rong.moe>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>  drivers/platform/x86/lenovo/wmi-events.c   |  2 +-
>  drivers/platform/x86/lenovo/wmi-gamezone.c |  1 -
>  drivers/platform/x86/lenovo/wmi-gamezone.h | 21 ---------------------
>  drivers/platform/x86/lenovo/wmi-helpers.h  | 13 +++++++++++++
>  drivers/platform/x86/lenovo/wmi-other.c    |  3 +--
>  5 files changed, 15 insertions(+), 25 deletions(-)
>  delete mode 100644 drivers/platform/x86/lenovo/wmi-gamezone.h
>
> diff --git a/drivers/platform/x86/lenovo/wmi-events.c 
> b/drivers/platform/x86/lenovo/wmi-events.c
> index 0994cd7dd504..9e9f2e82e04d 100644
> --- a/drivers/platform/x86/lenovo/wmi-events.c
> +++ b/drivers/platform/x86/lenovo/wmi-events.c
> @@ -17,7 +17,7 @@
>  #include <linux/wmi.h>
> 
>  #include "wmi-events.h"
> -#include "wmi-gamezone.h"
> +#include "wmi-helpers.h"
> 
>  #define THERMAL_MODE_EVENT_GUID "D320289E-8FEA-41E0-86F9-911D83151B5F"
> 
> diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c 
> b/drivers/platform/x86/lenovo/wmi-gamezone.c
> index a91089694727..5a8f4aee02cf 100644
> --- a/drivers/platform/x86/lenovo/wmi-gamezone.c
> +++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
> @@ -21,7 +21,6 @@
>  #include <linux/wmi.h>
> 
>  #include "wmi-events.h"
> -#include "wmi-gamezone.h"
>  #include "wmi-helpers.h"
> 
>  #define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
> diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.h 
> b/drivers/platform/x86/lenovo/wmi-gamezone.h
> deleted file mode 100644
> index ddb919cf6c36..000000000000
> --- a/drivers/platform/x86/lenovo/wmi-gamezone.h
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -
> -/* Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
> -
> -#ifndef _LENOVO_WMI_GAMEZONE_H_
> -#define _LENOVO_WMI_GAMEZONE_H_
> -
> -enum gamezone_events_type {
> -	LWMI_GZ_GET_THERMAL_MODE = 1,
> -};
> -
> -enum thermal_mode {
> -	LWMI_GZ_THERMAL_MODE_NONE =	   0x00,
> -	LWMI_GZ_THERMAL_MODE_QUIET =	   0x01,
> -	LWMI_GZ_THERMAL_MODE_BALANCED =	   0x02,
> -	LWMI_GZ_THERMAL_MODE_PERFORMANCE = 0x03,
> -	LWMI_GZ_THERMAL_MODE_EXTREME =	   0xE0, /* Ver 6+ */
> -	LWMI_GZ_THERMAL_MODE_CUSTOM =	   0xFF,
> -};
> -
> -#endif /* !_LENOVO_WMI_GAMEZONE_H_ */
> diff --git a/drivers/platform/x86/lenovo/wmi-helpers.h 
> b/drivers/platform/x86/lenovo/wmi-helpers.h
> index 651a039228ed..ed7db3ebba6c 100644
> --- a/drivers/platform/x86/lenovo/wmi-helpers.h
> +++ b/drivers/platform/x86/lenovo/wmi-helpers.h
> @@ -16,6 +16,19 @@ struct wmi_method_args_32 {
>  	u32 arg1;
>  };
> 
> +enum lwmi_event_type {
> +	LWMI_GZ_GET_THERMAL_MODE = 0x01,
> +};
> +
> +enum thermal_mode {
> +	LWMI_GZ_THERMAL_MODE_NONE =	   0x00,
> +	LWMI_GZ_THERMAL_MODE_QUIET =	   0x01,
> +	LWMI_GZ_THERMAL_MODE_BALANCED =	   0x02,
> +	LWMI_GZ_THERMAL_MODE_PERFORMANCE = 0x03,
> +	LWMI_GZ_THERMAL_MODE_EXTREME =	   0xE0, /* Ver 6+ */
> +	LWMI_GZ_THERMAL_MODE_CUSTOM =	   0xFF,
> +};
> +
>  int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
>  			  unsigned char *buf, size_t size, u32 *retval);
> 
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c 
> b/drivers/platform/x86/lenovo/wmi-other.c
> index 1d1bab98298b..e475d1d8a5a7 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -46,7 +46,6 @@
> 
>  #include "wmi-capdata.h"
>  #include "wmi-events.h"
> -#include "wmi-gamezone.h"
>  #include "wmi-helpers.h"
>  #include "../firmware_attributes_class.h"
> 
> @@ -787,7 +786,7 @@ static bool lwmi_attr_01_is_supported(struct 
> tunable_attr_01 *tunable_attr)
>  {
>  	u8 modes[2] = { LWMI_GZ_THERMAL_MODE_CUSTOM, 
> LWMI_GZ_THERMAL_MODE_NONE };
>  	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
> -	struct wmi_method_args_32 args = { 0x0, 0x0 };
> +	struct wmi_method_args_32 args = {};

Was this change intentional? It's seems unrelated to the commit description.

>  	bool cd_mode_found = false;
>  	bool cv_mode_found = false;
>  	struct capdata01 capdata;
> -- 
> 2.53.0
