Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792771517;
	b=3lP2l/F1iS6ELGjfmXeTig7rcVViVhRE76Jlv9i9HV4a1BIDKh4eu4grFP056OJlsXn6
	 kT7Ra9vX8rudmcOLrsaoGzrslB6AyeK87oJ7roZzkag9kyY8ejwVg8yl8stwTReVNoJtu
	 YuwxjSJVUph7XU1aeQ/pFLmDgsQR50IIzzKTPOU5/ho+ufWApevmRicaX0wdzPwbUy9MH
	 tJk7gjm59YPTyVQRVVDOZsW8T+gamME/kt9J5im16oiQIKTG8CUVPTLTjR2/l3yblkRTm
	 gg5Zx6dXDFTWmBaQVHzfJWsu9rOo+4zFF39i3krtsxeazFF1HPA/mZsWMQIBmnFOfOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792771517;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=PJF8dOxcKdoo4LPQNy4POGZqpVXU0l7de5E8tpWUurs=;
	b=Ott/OqAlR+Hbp3hm2TzX2uqHOhehSbeD2gt6e3pK1ByvOKyVl7zzBMt13nQkCPteHw8B
	 BOY9bbdcNqDj73ccDuljpXfN4gbTNSZIHUE2GXm/kFp9ACxSZyaHiZx1Wbd/4bBUdk9AQ
	 5KCSAat+UToo3Ql9vtJu8QzGTmdLBjQqpFBomK3xNJh9mVt/+zY0Z+v3hG6AmwjggJlfR
	 yTmDEcZt2bZoE2022iGqEqol2uEdbwW+AUCw8k4pCRpPM2HE8UlvUHye8TL+LXPhB19Lc
	 H4NCaa65Mmn3JNgkHEM9mynBz/7G6O7GxGtz6DOYm1R7JxoDwXdb89bs0ebVk4PsEEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.im;
	spf=pass smtp.mailfrom=fastmail.im;
	dkim=pass header.d=fastmail.im header.i=@fastmail.im header.a=rsa-sha256 header.s=fm2 header.b=nTRmedeV;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=lLsn3ika;
	arc=none smtp.remote-ip=103.168.172.155
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425E6606A31A
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 16:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 425E6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.im header.i=@fastmail.im header.a=rsa-sha256 header.s=fm2 header.b=nTRmedeV;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=lLsn3ika
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 40A4E1400050
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 12:05:16 -0400 (EDT)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Fri, 23 Oct 2026 12:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1792771511;
	 x=1792857911; bh=PJF8dOxcKdoo4LPQNy4POGZqpVXU0l7de5E8tpWUurs=; b=
	nTRmedeVsVzlMVPME1WY2sS1IOhzcNda1NKtWIbzh48/niRDJpv4djPbbfLjFvGu
	1XLK9IZChkMxa1t6I8WgRefFXLRfHKHQ+rCgNNRD6/NTuJ2m6dw3QId3ayMek0xE
	gruICQD+sgbMc0fj6cdKv7To5/Ke5po2NOWKQDr4epbhDsOF3jQh8jf+sIwL09fv
	7J80YLssss96IldosfXpdK1oQI9Jvs/i79wJB9e2EQSbyzeC4h/EHa6YjzFmV+up
	o3D1Tva2N6a/XNfDQj7b73TgYqqbYKuwY2Cvtuef0dv28UtnRY7CEyVHQWmHqRaw
	kv3is+LEQxzPbdDyQLiujw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792771511; x=
	1792857911; bh=PJF8dOxcKdoo4LPQNy4POGZqpVXU0l7de5E8tpWUurs=; b=l
	Lsn3ikaIEWpcmk8HRO0uLRWmehqm8rTbs6IDmLg1JnYy/4vq6LlB/3+YL8jKACzU
	/j/RagD71tPW1vHACMVU3gzzHzGXy/5uoK6SdXCIKtYdnVB6LO0yZVp61s1+hyCR
	qYrxJ1WWB/5w8HdgpKLwJkS07R2SD87cjBudzDt/Yzeid5Wn8vgb6pwb7eHIg3lE
	WGO37nJbcL01UMH9k8NUvsVfMBvl2fWiJ/zT4T2nb+gIfxzKOK+f4Q7BTRuXSHry
	KAm8N3WuwKLeFFymtTh1UoM/Q/Bab83hhAQB8TETxDiOrATefaIru8yHFOOAk0JJ
	rAnk4R5RtDga/RofHo2CQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=fastmail.im a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792771511; d=fastmail.im;
	mf=PGFsaWNlLmtlcm5lbEBmYXN0bWFpbC5pbT4=;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:hZ6N5jY4gETVhvzUbtJNhisQgkqVY69zBG6/A8BMWzXZotM
	EDYlpSsxh1BvH15ac7Rwbc46xBY7rrkEo7V/UtJRBZM/71rjInaoatS9laoEqbDl
	pXU/beHtVfFYnkSafUlajtZXAlExl3jee2qUFBr2tK9KiRN46aMTCAFngvP3B6V2
	wQoIKsMDiUOTY0dTD7j02qUIK/Pfi/jQ4+JYxN7KnA49SGeJnuw4bjO0H2JtuyGX
	XuHZbAExzXcrs9l3mLGd9GERQ2lcp3rz2UK6xNsNOouEMr0osn5wp457u1fEwL3p
	bnJN6nglz7crenVt26mUNgkjoVOgyDNzjbxMNag==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:oZME11fcZ2ZgdXeht+WREmzpaikrkCtqk9QzuOF7c0w=:M0rHMYFoUd1OKTevL5Z9y+am5kGfK/uX0IByGeL1fkc=;
X-ME-Sender: <xms:soXbajL8IPFbjjn38GiPPJ9-YOlxiEqBu3AtBWs_AW7cS_oHox6P9g>
    <xme:soXbah8hRwOMFsW-SJTDfDMWlaxowYG_YsUjsWMIudLgFArLvnJ8yloIkr98b1LfS
    FYVmuRmunuQH2crYCbxxOJvineJtmrxmXJcjr2JBi93XBiSH8dE7A8>
X-ME-Proxy-Cause: dmFkZTFHtP6MbAtgLQqcO0WMConwut/qdN8SDie4k2H/aim847BXx6jJmC2o+VxXtwehxw
    7rC2YEbwzA/t+upbHmjW1t377udsibhOxVYFKP/SJCoeonoBz1nqrNqJlJG7sAlYafJvKX
    hde26pRbico9nHsCC4hcqSs30tZ5rX+kQ61Av71lSE0hvc4ZwWsgVbGxC8LC/wr5PpXA3f
    PRgxBLJn8frA9qfrajRkgF8L/+PMlMUK9Pr69eHffQYq7GTsS9LZN5YHwvx0QBFKCWjlWO
    4a0/ZHASCFz4NCpWa7T8aWtvaOqx5GXr0WLxsYO8aXOqUgruZUnRpXFvzwyM3aLixYrXiS
    fToCjFM/ZW0l7lfQz9uPapX99WObuShEgSHLIP7YUvMMUfDCj5MEqge0WrEBskXHWdEg1l
    +YQipOPCXLC5BneQnQsrPyRf04AT/x+aMpUAD5xN4+3YOF6FiWBtSIOazV/xMLQspyIDkv
    DN+tcZo8omti0Uqmr8ADvAkvy9W4PwrRhzHGHSutdFS1KB8E1Z8Enj6p6vnW+e1vxGYTYm
    5TO5lVpjK8VKMxTMOESjOsrIr0Z66c78VzZKzh0x3CDHyErifKUal3TzYkEf+qw5yKspoJ
    rX+iKNegQW4KtyPHeM2U4LXiBrb1ARf18sAIKNL4uEto1K6oVIxfMh/3trKQ
X-ME-Proxy: <xmx:tIXbaouv1lnloepSeA53SWsWjW5arw_Qm5R8GED0SoJTx6XDtjxCVw>
    <xmx:tIXbatqwtUKZT4BKKwnQW1kNwydmbLprxe3MrMYp_j7MY5sIscSocw>
    <xmx:tIXbavXqskJi5ynioDsrpM61mX8wqSC9db6zaVJ3J7Ty9oMQodJnTw>
    <xmx:tIXbal2umpddhvMq4s84gRURWVL4x5CRB5SLG_Exu-qfft3E_TPO-A>
    <xmx:t4Xbap9YEQcamZTg6POUrwOSql10z7HCMuWoEoCs1cHcvsPOzCctcJhO>
Feedback-ID: i559e4809:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 90C0B2F8005D; Fri, 23 Oct 2026 12:05:06 -0400 (EDT)
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
Date: Fri, 23 Oct 2026 19:04:29 +0300
From: "Alice Mikityanska" <alice.kernel@fastmail.im>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Ike Panhc" <ikepanhc@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Maxim Mikityanskiy" <maxtram95@gmail.com>
Message-Id: <9250be99-ce79-4d86-a5eb-c7640fb7c421@app.fastmail.com>
In-Reply-To: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com>
References: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com>
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard controller
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Oct 22, 2026, at 07:50, Dmitry Torokhov wrote:
> On Ideapad Z570 the driver tries to disable and re-enable data coming
> from the touchpad by poking directly into 8042 keyboard controller.
> This may coincide with the controller resuming and leads to spews in
> dmesg and potentially other instabilities.
>
> Instead of using i8042_command() to control the touchpad state create
> an input handler that serves as a filter and drop events coming from
> the touchpad when it is supposed to be off.
>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> v3:
> - add missing header includes (compiler.h, container_of.h, errno.h,
>   mod_devicetable.h, slab.h, spinlock.h)
> - drop stray blank line in ideapad_tpswitch_filter()
> - collect Reviewed-by from Mark Pearson
>
> v2:
> - fix inverted condition in ideapad_tpswitch_filter()
> - mark the handler as passive_observer so that touchpad is not activated
>   until there are real users
> - use READ_ONCE()/WRITE_ONCE() to access shared state flag
> - drop stray semicolon in to_tpswitch_handle()
> - update comments
>
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 189 ++++++++++++++++++-
>  1 file changed, 180 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c 
> b/drivers/platform/x86/lenovo/ideapad-laptop.c
> index 8213524504ee..be890e82b9ef 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -14,23 +14,28 @@
>  #include <linux/bitops.h>
>  #include <linux/bug.h>
>  #include <linux/cleanup.h>
> +#include <linux/compiler.h>
> +#include <linux/container_of.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dmi.h>
> -#include <linux/i8042.h>
> +#include <linux/errno.h>
>  #include <linux/init.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
>  #include <linux/power_supply.h>
>  #include <linux/rfkill.h>
>  #include <linux/seq_file.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
>  #include <linux/string_choices.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
> @@ -210,6 +215,13 @@ struct ideapad_private {
>  		struct led_classdev led;
>  		unsigned int last_brightness;
>  	} fn_lock;
> +	struct {
> +		bool initialized;
> +		bool active; /* true means touchpad is enabled */
> +		struct input_handler handler;
> +		struct input_dev *tp_dev;
> +		spinlock_t lock;
> +	} tp_switch;
>  };
> 
>  static bool no_bt_rfkill;
> @@ -234,7 +246,7 @@ MODULE_PARM_DESC(set_fn_lock_led,
>  static bool ctrl_ps2_aux_port;
>  module_param(ctrl_ps2_aux_port, bool, 0444);
>  MODULE_PARM_DESC(ctrl_ps2_aux_port,
> -		 "Enable driver based PS/2 aux port en-/dis-abling on touchpad 
> on/off toggle. If you need this please report this to: 
> platform-driver-x86@vger.kernel.org");
> +		 "Enable driver based suppression of touchpad events on touchpad 
> on/off toggle. If you need this please report this to: 
> platform-driver-x86@vger.kernel.org");
> 
>  static bool touchpad_ctrl_via_ec;
>  module_param(touchpad_ctrl_via_ec, bool, 0444);
> @@ -1462,6 +1474,159 @@ static void 
> ideapad_check_special_buttons(struct ideapad_private *priv)
>  	}
>  }
> 
> +struct ideapad_tpswitch_handle {
> +	struct input_handle handle;
> +	struct ideapad_private *priv;
> +};
> +
> +#define to_tpswitch_handle(h) \
> +	container_of(h, struct ideapad_tpswitch_handle, handle)
> +
> +static int ideapad_tpswitch_connect(struct input_handler *handler,
> +				    struct input_dev *dev,
> +				    const struct input_device_id *id)
> +{
> +	struct ideapad_private *priv =
> +		container_of(handler, struct ideapad_private, tp_switch.handler);
> +	struct ideapad_tpswitch_handle *h;
> +	int error;
> +
> +	h = kzalloc_obj(*h);
> +	if (!h)
> +		return -ENOMEM;
> +
> +	h->priv = priv;
> +	h->handle.dev = dev;
> +	h->handle.handler = handler;
> +	h->handle.name = "ideapad-tpswitch";
> +
> +	error = input_register_handle(&h->handle);
> +	if (error)
> +		goto err_free_handle;
> +
> +	/*
> +	 * We need to open the input handle so the input core invokes our
> +	 * filter, but since we mark our handler as passive observer, this
> +	 * will not cause the underlying touchpad hardware to be started
> +	 * if there are no other users.
> +	 */
> +	error = input_open_device(&h->handle);
> +	if (error)
> +		goto err_unregister_handle;
> +
> +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
> +		priv->tp_switch.tp_dev = dev;
> +
> +	return 0;
> +
> +err_unregister_handle:
> +	input_unregister_handle(&h->handle);
> +err_free_handle:
> +	kfree(h);
> +	return error;
> +}
> +
> +static void ideapad_tpswitch_disconnect(struct input_handle *handle)
> +{
> +	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
> +	struct ideapad_private *priv = h->priv;
> +
> +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
> +		priv->tp_switch.tp_dev = NULL;
> +
> +	input_close_device(handle);
> +	input_unregister_handle(handle);
> +	kfree(h);
> +}
> +
> +static bool ideapad_tpswitch_filter(struct input_handle *handle,
> +				    unsigned int type, unsigned int code,
> +				    int value)
> +{
> +	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
> +	struct ideapad_private *priv = h->priv;
> +
> +	if (READ_ONCE(priv->tp_switch.active))
> +		return false;
> +
> +	/* Allow passing button release events, drop everything else */
> +	return !(type == EV_KEY && value == 0) &&
> +	       !(type == EV_SYN && code == SYN_REPORT);
> +}
> +
> +static const struct input_device_id ideapad_tpswitch_ids[] = {
> +	{
> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
> +				INPUT_DEVICE_ID_MATCH_KEYBIT |
> +				INPUT_DEVICE_ID_MATCH_ABSBIT,
> +		.bustype = BUS_I8042,
> +		.vendor = 0x0002,
> +		.evbit = { BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS) },
> +		.keybit = { [BIT_WORD(BTN_TOOL_FINGER)] =
> +				BIT_MASK(BTN_TOOL_FINGER) },
> +		.absbit = { BIT_MASK(ABS_X) | BIT_MASK(ABS_Y) |
> +				BIT_MASK(ABS_PRESSURE) |
> +				BIT_MASK(ABS_TOOL_WIDTH) },
> +	},
> +	{ }
> +};
> +
> +static int ideapad_tpswitch_init(struct ideapad_private *priv)
> +{
> +	int error;
> +
> +	if (!priv->features.ctrl_ps2_aux_port)
> +		return 0;
> +
> +	spin_lock_init(&priv->tp_switch.lock);
> +
> +	priv->tp_switch.handler.name = "ideapad-tpswitch";
> +	priv->tp_switch.handler.id_table = ideapad_tpswitch_ids;
> +	priv->tp_switch.handler.filter = ideapad_tpswitch_filter;
> +	priv->tp_switch.handler.connect = ideapad_tpswitch_connect;
> +	priv->tp_switch.handler.disconnect = ideapad_tpswitch_disconnect;
> +	priv->tp_switch.handler.passive_observer = true;
> +
> +	error = input_register_handler(&priv->tp_switch.handler);
> +	if (error) {
> +		dev_err(&priv->platform_device->dev,
> +			"failed to register touchpad switch handler: %d",
> +			error);
> +		return error;
> +	}
> +
> +	priv->tp_switch.initialized = true;
> +	return 0;
> +}
> +
> +static void ideapad_tpswitch_exit(struct ideapad_private *priv)
> +{
> +	if (priv->tp_switch.initialized) {
> +		input_unregister_handler(&priv->tp_switch.handler);
> +		priv->tp_switch.initialized = false;
> +	}
> +}
> +
> +static void ideapad_tpswitch_toggle(struct ideapad_private *priv, bool 
> on)
> +{
> +	guard(spinlock_irq)(&priv->tp_switch.lock);
> +
> +	WRITE_ONCE(priv->tp_switch.active, on);
> +	if (!on) {
> +		struct input_dev *tp_dev = priv->tp_switch.tp_dev;
> +		if (tp_dev) {
> +			input_report_key(tp_dev, BTN_TOUCH, 0);
> +			input_report_key(tp_dev, BTN_TOOL_FINGER, 0);
> +			input_report_key(tp_dev, BTN_TOOL_DOUBLETAP, 0);
> +			input_report_key(tp_dev, BTN_TOOL_TRIPLETAP, 0);
> +			input_report_key(tp_dev, BTN_LEFT, 0);
> +			input_report_key(tp_dev, BTN_RIGHT, 0);
> +			input_report_key(tp_dev, BTN_MIDDLE, 0);

Hello!

Tested-by: Alice Mikityanska <alice.kernel@fastmail.im>

Seems to work well, without any "lost synchronization" messages in
dmesg. There is a new effect, caused by the above lines: if the finger
stays on the surface the entire time, and the user disables and enables
the touchpad, the pointer won't move until the user lifts the finger and
puts it back. Although it's unlikely to break anyone's workflow, I need
to double-check that the evdev doesn't emit some invalid sequence of
events, e.g., touch 0 followed by some movements, or touch 0 followed by
another touch 0.

> +			input_sync(tp_dev);
> +		}
> +	}
> +}
> +
>  /*
>   * backlight
>   */
> @@ -1799,7 +1964,6 @@ static void ideapad_fn_lock_led_exit(struct 
> ideapad_private *priv)
>  static void ideapad_sync_touchpad_state(struct ideapad_private *priv, 
> bool send_events)
>  {
>  	unsigned long value;
> -	unsigned char param;
>  	int ret;
> 
>  	/* Without reading from EC touchpad LED doesn't switch state */
> @@ -1810,12 +1974,11 @@ static void ideapad_sync_touchpad_state(struct 
> ideapad_private *priv, bool send_
> 
>  	/*
>  	 * Some IdeaPads don't really turn off touchpad - they only
> -	 * switch the LED state. We (de)activate KBC AUX port to turn
> -	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
> -	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
> +	 * switch the LED state. On such devices we use an input filter to
> +	 * suppress events from the touchpad.
>  	 */
>  	if (priv->features.ctrl_ps2_aux_port)
> -		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
> +		ideapad_tpswitch_toggle(priv, value);
> 
>  	/*
>  	 * On older models the EC controls the touchpad and toggles it on/off
> @@ -2018,8 +2181,8 @@ static const struct dmi_system_id hw_rfkill_list[] = {
>  /*
>   * On some models the EC toggles the touchpad muted LED on touchpad toggle
>   * hotkey presses, but the EC does not actually disable the touchpad itself.
> - * On these models the driver needs to explicitly enable/disable the i8042
> - * (PS/2) aux port.
> + * On these models the driver needs to explicitly suppress data coming from
> + * the touchpad.
>   */
>  static const struct dmi_system_id ctrl_ps2_aux_port_list[] = {
>  	{
> @@ -2402,6 +2565,10 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  	if (err)
>  		goto input_failed;
> 
> +	err = ideapad_tpswitch_init(priv);
> +	if (err)
> +		goto tpswitch_failed;
> +
>  	err = ideapad_kbd_bl_init(priv);
>  	if (err) {
>  		if (err != -ENODEV)
> @@ -2478,6 +2645,9 @@ static int ideapad_acpi_add(struct platform_device *pdev)
> 
>  	ideapad_fn_lock_led_exit(priv);
>  	ideapad_kbd_bl_exit(priv);
> +	ideapad_tpswitch_exit(priv);
> +
> +tpswitch_failed:
>  	ideapad_input_exit(priv);
> 
>  input_failed:
> @@ -2507,6 +2677,7 @@ static void ideapad_acpi_remove(struct 
> platform_device *pdev)
> 
>  	ideapad_fn_lock_led_exit(priv);
>  	ideapad_kbd_bl_exit(priv);
> +	ideapad_tpswitch_exit(priv);
>  	ideapad_input_exit(priv);
>  	ideapad_debugfs_exit(priv);
>  }
>
> -- 
> Dmitry
