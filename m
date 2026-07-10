Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DCC3B9943
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 07:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783668887; cv=none; b=LLMETEiOaH3OYlwIJDrrDXq7INsfSZ896FRhcLYGSEpbs26mXPp49No6FtBg7bvI9FYCkMwypXU5rbnvICvEIsZKcgaPMbOkd9tltbj2jWEjlwCultqkj0GWX/6tmFVaNVQPlgIq1XSBEpcxH9+geelIm7YGGb/o5kES2UK9C1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783668887; c=relaxed/simple;
	bh=An+rNAjXL/OY0Uq+VZkAX3aw3+fwc4X71gnEdu2XmY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGSgWNOLIVX0Ebz1vMYZvU6A3byVSD3pgbWqQL3uXOsy6Z4aSktroH0baI+f0aN2+inmTlJT1fXZ1s0UR/Q8zI/brt4/x1HQ8BDHIxgU69O1kzKgMs+6PLBzw7e50yHkkbwIWmTO6Tfs5XRnQO7mjWX7TjR+zvio2YeMJiAVRn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vf9tldq/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jCgEC9QA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vf9tldq/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jCgEC9QA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vf9tldq/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jCgEC9QA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vf9tldq/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jCgEC9QA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 04B287637D;
	Fri, 10 Jul 2026 07:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783668884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Kt5uAC8VDnnXaI7L2vLhKMWScYO0gfjOqzujh3uhx60=;
	b=vf9tldq/3Wch7kxZSghK7TGHCMouHYhQxdqzTZIHHaSGQBYm1ph0TxhCTa7cSzIivbnJrl
	r1xYfno2Ty8UItIxIiqMe7QDB7B5KW8MHYGSCJSAiJfTqFeaQSXisRRKiTJn2TVU5n5IeU
	k+E4Z6diFOE3loWQaXuQ+U3J/SE+Iy0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783668884;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Kt5uAC8VDnnXaI7L2vLhKMWScYO0gfjOqzujh3uhx60=;
	b=jCgEC9QAHWHtMi2hk1DhgS88arjkyb5SpqpkEuyWBNLhI0FHqE/imUgqQGA+cKVzVPf1RD
	p03wp2IbxqJlldCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783668884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Kt5uAC8VDnnXaI7L2vLhKMWScYO0gfjOqzujh3uhx60=;
	b=vf9tldq/3Wch7kxZSghK7TGHCMouHYhQxdqzTZIHHaSGQBYm1ph0TxhCTa7cSzIivbnJrl
	r1xYfno2Ty8UItIxIiqMe7QDB7B5KW8MHYGSCJSAiJfTqFeaQSXisRRKiTJn2TVU5n5IeU
	k+E4Z6diFOE3loWQaXuQ+U3J/SE+Iy0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783668884;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Kt5uAC8VDnnXaI7L2vLhKMWScYO0gfjOqzujh3uhx60=;
	b=jCgEC9QAHWHtMi2hk1DhgS88arjkyb5SpqpkEuyWBNLhI0FHqE/imUgqQGA+cKVzVPf1RD
	p03wp2IbxqJlldCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5FF47779BD;
	Fri, 10 Jul 2026 07:34:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QMwBFpOgUGo8LQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 10 Jul 2026 07:34:43 +0000
Message-ID: <669f105a-a624-410f-aae0-6f2ba6194f64@suse.de>
Date: Fri, 10 Jul 2026 09:34:42 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] firmware: Rename google firmware directory to
 coreboot
To: Sean Rhodes <sean@starlabs.systems>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>,
 Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Joshua Grisham <josh@joshuagrisham.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Dell.Client.Kernel@dell.com, Brian Norris <briannorris@chromium.org>,
 Julius Werner <jwerner@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
 Kees Cook <kees@kernel.org>, chrome-platform@lists.linux.dev
References: <cover.1783663929.git.sean@starlabs.systems>
 <4cc4e0c4b69aaea7e5af730ab72831a25ea1469e.1783663929.git.sean@starlabs.systems>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <4cc4e0c4b69aaea7e5af730ab72831a25ea1469e.1783663929.git.sean@starlabs.systems>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com,ljones.dev,linux.dev,dell.com,hp.com,squebb.ca,joshuagrisham.com,redhat.com,chromium.org,broadcom.com,vger.kernel.org,lists.linux.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -2.80

Hi

Am 10.07.26 um 08:12 schrieb Sean Rhodes:
> Most drivers in drivers/firmware/google are coreboot table drivers rather
> than Google-specific firmware drivers. Rename the directory to coreboot
> and update the Kconfig prompt, build path and maintainer entry.
>
> Keep the existing CONFIG_GOOGLE_* symbols to avoid user configuration
> churn in this mechanical move.

You can use 'transitional' for easily renaming Kconfig options.

https://elixir.bootlin.com/linux/v7.1.2/source/Documentation/kbuild/kconfig-language.rst#L245

Best regards
Thomas

>
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>
> ---
>   MAINTAINERS                                                 | 4 ++--
>   drivers/firmware/Kconfig                                    | 2 +-
>   drivers/firmware/Makefile                                   | 2 +-
>   drivers/firmware/{google => coreboot}/Kconfig               | 6 +++---
>   drivers/firmware/{google => coreboot}/Makefile              | 0
>   drivers/firmware/{google => coreboot}/cbmem.c               | 0
>   drivers/firmware/{google => coreboot}/coreboot_table.c      | 0
>   drivers/firmware/{google => coreboot}/coreboot_table.h      | 0
>   .../firmware/{google => coreboot}/framebuffer-coreboot.c    | 0
>   drivers/firmware/{google => coreboot}/gsmi.c                | 0
>   drivers/firmware/{google => coreboot}/memconsole-coreboot.c | 0
>   .../firmware/{google => coreboot}/memconsole-x86-legacy.c   | 0
>   drivers/firmware/{google => coreboot}/memconsole.c          | 0
>   drivers/firmware/{google => coreboot}/memconsole.h          | 6 +++---
>   drivers/firmware/{google => coreboot}/vpd.c                 | 0
>   drivers/firmware/{google => coreboot}/vpd_decode.c          | 0
>   drivers/firmware/{google => coreboot}/vpd_decode.h          | 0
>   17 files changed, 10 insertions(+), 10 deletions(-)
>   rename drivers/firmware/{google => coreboot}/Kconfig (94%)
>   rename drivers/firmware/{google => coreboot}/Makefile (100%)
>   rename drivers/firmware/{google => coreboot}/cbmem.c (100%)
>   rename drivers/firmware/{google => coreboot}/coreboot_table.c (100%)
>   rename drivers/firmware/{google => coreboot}/coreboot_table.h (100%)
>   rename drivers/firmware/{google => coreboot}/framebuffer-coreboot.c (100%)
>   rename drivers/firmware/{google => coreboot}/gsmi.c (100%)
>   rename drivers/firmware/{google => coreboot}/memconsole-coreboot.c (100%)
>   rename drivers/firmware/{google => coreboot}/memconsole-x86-legacy.c (100%)
>   rename drivers/firmware/{google => coreboot}/memconsole.c (100%)
>   rename drivers/firmware/{google => coreboot}/memconsole.h (82%)
>   rename drivers/firmware/{google => coreboot}/vpd.c (100%)
>   rename drivers/firmware/{google => coreboot}/vpd_decode.c (100%)
>   rename drivers/firmware/{google => coreboot}/vpd_decode.h (100%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ec0a12121357..01344fc92253 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11068,14 +11068,14 @@ S:	Maintained
>   F:	Documentation/networking/device_drivers/ethernet/google/gve.rst
>   F:	drivers/net/ethernet/google
>   
> -GOOGLE FIRMWARE DRIVERS
> +COREBOOT FIRMWARE DRIVERS
>   M:	Tzung-Bi Shih <tzungbi@kernel.org>
>   R:	Brian Norris <briannorris@chromium.org>
>   R:	Julius Werner <jwerner@chromium.org>
>   L:	chrome-platform@lists.linux.dev
>   S:	Maintained
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
> -F:	drivers/firmware/google/
> +F:	drivers/firmware/coreboot/
>   F:	include/linux/coreboot.h
>   
>   GOOGLE TENSOR SoC SUPPORT
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 78a239f8bbef..4df0a0ad18b8 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -293,7 +293,7 @@ endif # TURRIS_MOX_RWTM
>   source "drivers/firmware/arm_ffa/Kconfig"
>   source "drivers/firmware/broadcom/Kconfig"
>   source "drivers/firmware/cirrus/Kconfig"
> -source "drivers/firmware/google/Kconfig"
> +source "drivers/firmware/coreboot/Kconfig"
>   source "drivers/firmware/efi/Kconfig"
>   source "drivers/firmware/imx/Kconfig"
>   source "drivers/firmware/meson/Kconfig"
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 385b6e8b7fc6..7a8fc3eeb3f0 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -30,7 +30,7 @@ obj-y				+= broadcom/
>   obj-y				+= cirrus/
>   obj-y				+= meson/
>   obj-y				+= microchip/
> -obj-$(CONFIG_GOOGLE_FIRMWARE)	+= google/
> +obj-$(CONFIG_GOOGLE_FIRMWARE)	+= coreboot/
>   obj-y				+= efi/
>   obj-y				+= imx/
>   obj-y				+= psci/
> diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/coreboot/Kconfig
> similarity index 94%
> rename from drivers/firmware/google/Kconfig
> rename to drivers/firmware/coreboot/Kconfig
> index b78c644fa253..b248bafe8b6b 100644
> --- a/drivers/firmware/google/Kconfig
> +++ b/drivers/firmware/coreboot/Kconfig
> @@ -1,10 +1,10 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   menuconfig GOOGLE_FIRMWARE
> -	bool "Google Firmware Drivers"
> +	bool "coreboot firmware drivers"
>   	default n
>   	help
> -	  These firmware drivers are used by Google servers,
> -	  Chromebooks and other devices using coreboot firmware.
> +	  These firmware drivers are used by devices running coreboot
> +	  firmware, including Chromebooks and some Google servers.
>   	  If in doubt, say "N".
>   
>   if GOOGLE_FIRMWARE
> diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/coreboot/Makefile
> similarity index 100%
> rename from drivers/firmware/google/Makefile
> rename to drivers/firmware/coreboot/Makefile
> diff --git a/drivers/firmware/google/cbmem.c b/drivers/firmware/coreboot/cbmem.c
> similarity index 100%
> rename from drivers/firmware/google/cbmem.c
> rename to drivers/firmware/coreboot/cbmem.c
> diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/coreboot/coreboot_table.c
> similarity index 100%
> rename from drivers/firmware/google/coreboot_table.c
> rename to drivers/firmware/coreboot/coreboot_table.c
> diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/coreboot/coreboot_table.h
> similarity index 100%
> rename from drivers/firmware/google/coreboot_table.h
> rename to drivers/firmware/coreboot/coreboot_table.h
> diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/coreboot/framebuffer-coreboot.c
> similarity index 100%
> rename from drivers/firmware/google/framebuffer-coreboot.c
> rename to drivers/firmware/coreboot/framebuffer-coreboot.c
> diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/coreboot/gsmi.c
> similarity index 100%
> rename from drivers/firmware/google/gsmi.c
> rename to drivers/firmware/coreboot/gsmi.c
> diff --git a/drivers/firmware/google/memconsole-coreboot.c b/drivers/firmware/coreboot/memconsole-coreboot.c
> similarity index 100%
> rename from drivers/firmware/google/memconsole-coreboot.c
> rename to drivers/firmware/coreboot/memconsole-coreboot.c
> diff --git a/drivers/firmware/google/memconsole-x86-legacy.c b/drivers/firmware/coreboot/memconsole-x86-legacy.c
> similarity index 100%
> rename from drivers/firmware/google/memconsole-x86-legacy.c
> rename to drivers/firmware/coreboot/memconsole-x86-legacy.c
> diff --git a/drivers/firmware/google/memconsole.c b/drivers/firmware/coreboot/memconsole.c
> similarity index 100%
> rename from drivers/firmware/google/memconsole.c
> rename to drivers/firmware/coreboot/memconsole.c
> diff --git a/drivers/firmware/google/memconsole.h b/drivers/firmware/coreboot/memconsole.h
> similarity index 82%
> rename from drivers/firmware/google/memconsole.h
> rename to drivers/firmware/coreboot/memconsole.h
> index aaff2b72b606..58899c2abaaa 100644
> --- a/drivers/firmware/google/memconsole.h
> +++ b/drivers/firmware/coreboot/memconsole.h
> @@ -7,8 +7,8 @@
>    * Copyright 2017 Google Inc.
>    */
>   
> -#ifndef __FIRMWARE_GOOGLE_MEMCONSOLE_H
> -#define __FIRMWARE_GOOGLE_MEMCONSOLE_H
> +#ifndef __FIRMWARE_COREBOOT_MEMCONSOLE_H
> +#define __FIRMWARE_COREBOOT_MEMCONSOLE_H
>   
>   #include <linux/types.h>
>   
> @@ -33,4 +33,4 @@ int memconsole_sysfs_init(void);
>    */
>   void memconsole_exit(void);
>   
> -#endif /* __FIRMWARE_GOOGLE_MEMCONSOLE_H */
> +#endif /* __FIRMWARE_COREBOOT_MEMCONSOLE_H */
> diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/coreboot/vpd.c
> similarity index 100%
> rename from drivers/firmware/google/vpd.c
> rename to drivers/firmware/coreboot/vpd.c
> diff --git a/drivers/firmware/google/vpd_decode.c b/drivers/firmware/coreboot/vpd_decode.c
> similarity index 100%
> rename from drivers/firmware/google/vpd_decode.c
> rename to drivers/firmware/coreboot/vpd_decode.c
> diff --git a/drivers/firmware/google/vpd_decode.h b/drivers/firmware/coreboot/vpd_decode.h
> similarity index 100%
> rename from drivers/firmware/google/vpd_decode.h
> rename to drivers/firmware/coreboot/vpd_decode.h

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG Nürnberg)


