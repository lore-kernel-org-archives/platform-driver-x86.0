Received: from mta1.migadu.com (out-113.mta1.migadu.com [95.215.58.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B236F3DAAD2
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2026 18:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792346564; cv=none; b=k8yJuTZBUAgwIFZiVRz/a68fh+H+PEKR1xP1e0y4Mt4Mm7tzzbXKuOLrBia7WSntTGYD/ckjTBrQrKeeQhMaProTVFAEgcDZ87Kjo15tFs6QkNy9j++ftmVc2B14xZUEkJ5NuXjMxcITio6z5EErZwQ0CqWsYi5OASJj4c6CdfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792346564; c=relaxed/simple;
	bh=+FkpIcbJBc1unx6lcV4sYQUkfhZO2/R7YSWkWEoy/bU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T03P656+mlDiJNju/bY4LfuRTGfKIsnfjmzcx8ZI89oH8i5QGOyUW9xnv7o1NADpK+ZX4AeuQXgAH8okRGWRFZK1DoXznCpCC3EBjj3oBHu9y/lXA7bjUzAf1QdshW0El5sgHJ5QTEUjcq27LhSvlB0kTCFDFT2nlvGoFu5eOGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lR9ezHZ/; arc=none smtp.client-ip=95.215.58.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lR9ezHZ/"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+FkpIcbJBc1unx6lcV4sYQUkfhZO2/R7YSWkWEoy/bU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792346559; v=1; x=1792951359;
 b=lR9ezHZ//hmFuv4Jz4r7ZWhp1WWhvN6q8XAILYqHkbwfjFqjRRjbeqCdUFWqKm8LSEQSMva1
 puUVrD06t1o+FoJIMoUw4sV+ES6wGy/jsQm2XMiJebbIsNJSpFGZ89hCWUGzR8WYFsPbvGV0JGK
 lwKpIbgNqE11qll14+g2ZSXo=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b7e4456cf56612ba;
	Sun, 18 Oct 2026 18:02:39 +0000
X-Mizu-Trace-ID: b7e4456cf56612ba
X-Migadu-Flow: FLOW_OUT
Message-ID: <1a35e100-010d-4327-afe5-1d2496ad7e24@linux.dev>
Date: Sun, 18 Oct 2026 20:02:38 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: map ScreenPad and Task Swap
 keys
To: victor.gillholm@gmail.com, Corentin Chary <corentin.chary@gmail.com>,
 "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261017-zenbook-duo-keys-v1-1-45f72d3db5ed@gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261017-zenbook-duo-keys-v1-1-45f72d3db5ed@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/17/26 20:13, Victor Gillholm via B4 Relay wrote:
> From: Victor Gillholm <victor.gillholm@gmail.com>
>
> The ASUS Zenbook Duo 14 UX482EG has two keys next to the power button:
> one toggles the ScreenPad Plus, the second screen above the keyboard,
> and one swaps windows between the two screens (Task Swap in ASUS'
> ScreenXpert software). They emit ASUS WMI event codes 0x6a and 0x9c.
> Neither code is in the asus-nb-wmi sparse keymap, so pressing them only
> logs "Unknown key code 0x6a" or "Unknown key code 0x9c", and both keys
> are reported as KEY_UNKNOWN, so ordinary desktop key bindings cannot
> tell them apart.
>
> Map 0x6a to KEY_F13, the same keycode hid-asus already uses for the
> ScreenPad toggle code 0x6a. No existing keycode describes moving windows
> between screens, so map 0x9c to KEY_F14, following the existing use of
> KEY_F13 and KEY_F14 for other ASUS-specific keys in this keymap. Both
> keys then emit distinct, bindable events.
>
> Tested on an ASUS Zenbook Duo 14 UX482EG: with this change the keys
> arrive in userspace as KEY_F13 and KEY_F14 and the "Unknown key code"
> messages are gone.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Victor Gillholm <victor.gillholm@gmail.com>
> ---
> Tested by building asus-nb-wmi against 7.2.5 and loading it in place of
> the stock module. The key mapping was checked with wev: before the change
> both keys arrived as keycode 248 with no keysym, after it as XF86Tools
> (KEY_F13) and XF86Launch5 (KEY_F14).
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 3b0f3346d..c6eb525ec 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -641,6 +641,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>  	{ KE_KEY, 0x65, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV */
>  	{ KE_KEY, 0x66, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV */
>  	{ KE_KEY, 0x67, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV */
> +	{ KE_KEY, 0x6A, { KEY_F13 } }, /* ScreenPad toggle on Zenbook Duo */

Hi Victor,

The driver is handling the screenpad so why not implementing the functionality in
the driver instead of doing the dance driver -> evdev -> remap -> driver ?

Unless I misunderstood what you want to do... Hopefully not!

>  	{ KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
>  	{ KE_IGNORE, 0x6E, },  /* Low Battery notification */
>  	{ KE_KEY, 0x71, { KEY_F13 } }, /* General-purpose button */
> @@ -666,6 +667,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>  	{ KE_KEY, 0x93, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV + DVI */
>  	{ KE_KEY, 0x95, { KEY_MEDIA } },
>  	{ KE_KEY, 0x99, { KEY_PHONE } }, /* Conflicts with fan mode switch */
> +	{ KE_KEY, 0x9C, { KEY_F14 } }, /* Task Swap key on Zenbook Duo */

Fair.

Best regards,
Denis Benato

>  	{ KE_KEY, 0X9D, { KEY_FN_F } },
>  	{ KE_KEY, 0xA0, { KEY_SWITCHVIDEOMODE } }, /* SDSP HDMI only */
>  	{ KE_KEY, 0xA1, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + HDMI */
>
> ---
> base-commit: ea40f1e9f07aab937b9a217633be7a1f66260394
> change-id: 20261017-zenbook-duo-keys-7e0b3f94354a
>
> Best regards,
> --  
> Victor Gillholm <victor.gillholm@gmail.com>
>
>
