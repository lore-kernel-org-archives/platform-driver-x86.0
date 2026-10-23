Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773504;
	b=AvRaVB4oJKvMVKrnxlIzwrmHRNe50QIJgzYZnrupD8tUZPEXvU+ViT/ATG1dI8JvW7Ox
	 u/ELHuB7QMFucMxvMkxeiKilqvdxotdBns+Ci0ncUSdZqThuxrgLkHiIgF+y0Rjl2/cSN
	 4LyOaHIzNXGsCi7ph/yirMhxC0x4rH/HZahtUyvH1EOc1FBLOBZjVQB9OJPmYDVkKilzT
	 LbroGK4rSd/Dm5pqkGH8OybGA+1FRUChBaBf9F+Fms0CQrQjausViy7nZkH3cluKJ6c2U
	 Nlz2q8TU+iFxkElebXQcrkJlR8z1ZFKuGQNufODFs5zWNRSSYFKbbCQAmcoXVLB6l1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773504;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=7vp5dP5TEl08T1SwyJ4aDvyx7iTGyltU1E9qOffsYVw=;
	b=ddunnPb/887dyeRTpQhxd1tfFGO5CJZSTXfM041bjbPsC0PPuBZ5TnaPZ6aCVHJ451Bk
	 t9m5i2gdOhL3XvW6pvqLU8QeEzsczh+ADlTXvdDcOC0uIkiVMxoiD9nzZEuisRpskXqCV
	 OIa06PRt/hh29JReSIID1teYg4FLwVdUtj894GMKano8O/qdFCleJdgv0fxcO0/28SY0j
	 tBmhh0Wf5jOOxHURoL0D4mVENZ3rrEOy/wjY8i8RO7u7u0g93bbL4JjUAC9QH1h9SRGAw
	 29Zfgu1ZXhS0HjF67fNJ86RvfAZc8fkplhu2Z9CnK+TVxdp2rYnuflrYef6rPPRShNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.im;
	spf=pass smtp.mailfrom=fastmail.im;
	dkim=pass header.d=fastmail.im header.i=@fastmail.im header.a=rsa-sha256 header.s=fm2 header.b=ElaJdGbr;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=xJDE5R2Q;
	arc=none smtp.remote-ip=103.168.172.155
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622EA606A31B
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 16:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 622EA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.im header.i=@fastmail.im header.a=rsa-sha256 header.s=fm2 header.b=ElaJdGbr;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=xJDE5R2Q
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 78AAE140010F
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 12:38:23 -0400 (EDT)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Fri, 23 Oct 2026 12:38:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1792773498;
	 x=1792859898; bh=7vp5dP5TEl08T1SwyJ4aDvyx7iTGyltU1E9qOffsYVw=; b=
	ElaJdGbrmdPKtMyNBezx6sLlpqoibvwWCCcW3ayo8lHE1wDzX6vwl76aXef9PJ/b
	gwu15oOYIWcM4nrO+5kUG9co1HScQM0FbtNuNZcbjv44C+LiM/o/J7LrfNZ+R5GI
	aZPA/T6FK5fXudMHDJoCEOfYtoWPcFeUB9Ycg27ZT04ZZRIQrm++pBdxP5Ka85LQ
	1/mbWhn5JI5f+1yHW+SZsgog3CFnNxNjVdb0Bn85GrXk+5nTlo16Om0zrbGxadID
	xqJ5NuTMVXoQvX7C6AX1znPUfN5b+HKVlW2cJFIEXc+33vJF9KXQ8M+vvS81CW9Y
	XJsBObtWmWqKVa7+1t8h2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792773498; x=
	1792859898; bh=7vp5dP5TEl08T1SwyJ4aDvyx7iTGyltU1E9qOffsYVw=; b=x
	JDE5R2Q71iFITQ3MeinDnyl50ZQqZBNyaeYy57wLSmttJbcLwdINQ4zQq2kDmjg5
	zyYLGBVuf+Wygcv6KNqiiV+l4S9CwQA6eq7a8f/KQLUjzs+yj2IKvyZFGU36vAr2
	lRCHDHX1kMByfg/dITLChzYzqEc+8YbB6OaxUszamAHseJDkbwX6Xppu6fVMWyC+
	RxTzknHcc2TfpmO3vX7RfNftfjwMXadWRi7K60bfa99YK5msQ/aZ1hVLvpboph3f
	e6gsKZzZ1KhbJTLjkPbZszOtoS8706xM6NmqRTKwnfEP9mCkc91E7bpJvanMajim
	lYgHN1iRyLaJAsc6gxi0w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=fastmail.im a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792773498; d=fastmail.im;
	mf=PGFsaWNlLmtlcm5lbEBmYXN0bWFpbC5pbT4=;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:jkvMkVhSvxji+LOqRXD+ghRnxcAerBhKol2WAPtYEOksZ17
	QvtMEnQdGLVDbia1ailmhQe5osJvz0iwaXpneFpwf1qiUOx+JpPVugLCamqfo0tx
	RM6+yjl1336QaPGdPnqooEcSK1BARQzvaZXd55l9eQWnVRCaqqIK6T6rmuz+URoy
	Eo1B9MrJGIblfDhojAR3PVCru8AThhTJuWBS60YdWYC6DotHEEs51fEp4qFKMXvO
	02b/La+iq0WRzKWkYXYDDLBIxEZVMhVaagKUQVBEvlm6G+cZyAni5u6DIjgiKmKq
	r9cZYCDQYpB3kh8fxh+4l7+bvz83YcGO4vz8XUw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:2c6wLl2bFrJ6RYl3Rp/phu5mRlH370RoCSlQTX4We98=:fpeIA3B3j14TwGbWpcznnY2cjFcnHbGvShfGXff2vPM=;
X-ME-Sender: <xms:do3bapkk4lg0__bo6SnPHeVD2hj2OVnOSgkg5eOkWSWSYDxhFnZPlA>
    <xme:do3bavrexUs0b0okWk4_UE0VZTQV-f7d1X9KBzzfZgcIFAqksi5hG4AXhHs4QA_P_
    eWb_9h0qru-vA8kVUAz2IQn6Yw3gVMI3qE4Skl5zRK0esluWk5M3lap>
X-ME-Proxy-Cause: dmFkZTFgWl4d9QTaxp91HOQgwZViDyA6lsUgfrGTdcNRujQaNLjt9zs+LMaLFJhg2IzEIp
    avlq3IYhNNQHRL6AWpNncoJZbq16WSvTDjw5xTJo+NUGcq4QOxtENKSfP5Buh7G+38Q/rM
    uLJ1gF/k34y1H9/7Crykbfz8BAX/OhQ1ZtTzevZjrIrLV+mRL7T46jE22dRHVdz6Dqpnqy
    xcW1v1LLeN5JdOgEJpqoTxqWA3PpZ5uZU+RuS8JylzFnrPTQ3GJb838LeIYXz/tEKiCZFd
    XF3GDdKZdeW3d/ef7YJVduLckhsTF3Qs7e+RyAmxV3oO9H7w1PVSnwnFzDqVmeNfjpEfru
    uZGkNHtsyQ6m5JqsIDiRpWraalaIhHb9Wzm9QyJqinHxvzkzjaP0iR+j5FyKykC4sf4EJn
    +SHl+NBLhtQYe1V2l7l3Ljfvje//o9xcYhZkOe5iMeOjrB0Qd0K+h74jK6VFCdsD/MTWTl
    5gPuzcjn16mxZSXXewo85q6M1l3Ao8bdbjU5yzT9H0vFW+YOA5nXtMBFjv4pbQantgtElA
    Zmfs17l6s+ZV1DQfx3f7hjfWkaMC+iQh0Xm5FrI1qxaIXiav6VkpEhc3lp5+jNTP9M5hHU
    EQmVsHe8HN3ySB8Fh0Z4gDieBI0sa7kIFgdAT/RtCDGoXzRp/KdSBBmqxkeg
X-ME-Proxy: <xmx:eI3bamLGRVr0WC9BUrZaKK0mTfYClBMHCFoUhPumIVXB2u4ujRfdIQ>
    <xmx:eI3bamWUu8BZvUuutp1AG_GM7MysdGwtQjj0lB839wuUmSXRhyZ8BA>
    <xmx:eI3baiSvx4P5EDood2vqEdnFEbWJYrOtNm1RR1oH0okLNc0BsPHmfg>
    <xmx:eI3bamBwCJMEsmp-M0iIm-iuhwxnvu-zT_vG92ROXBqy3rQuc0-Y9Q>
    <xmx:eo3bapq0m5BiaSewPGuokWzb_qqZHuu5pPvZipZHYR4k7-3rfyvW0w_->
Feedback-ID: i559e4809:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B0AE82F8005C; Fri, 23 Oct 2026 12:38:14 -0400 (EDT)
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
Date: Fri, 23 Oct 2026 19:37:34 +0300
From: "Alice Mikityanska" <alice.kernel@fastmail.im>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Ike Panhc" <ikepanhc@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Maxim Mikityanskiy" <maxtram95@gmail.com>
Message-Id: <f7bc115a-647e-4db1-9a36-659bafcb2d5d@app.fastmail.com>
In-Reply-To: <9250be99-ce79-4d86-a5eb-c7640fb7c421@app.fastmail.com>
References: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com>
 <9250be99-ce79-4d86-a5eb-c7640fb7c421@app.fastmail.com>
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard controller
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 23, 2026, at 19:04, Alice Mikityanska wrote:
> On Thu, Oct 22, 2026, at 07:50, Dmitry Torokhov wrote:
>> On Ideapad Z570 the driver tries to disable and re-enable data coming
>> from the touchpad by poking directly into 8042 keyboard controller.
>> This may coincide with the controller resuming and leads to spews in
>> dmesg and potentially other instabilities.
>>
>> Instead of using i8042_command() to control the touchpad state create
>> an input handler that serves as a filter and drop events coming from
>> the touchpad when it is supposed to be off.
>>
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> ---
>>
>> v3:
>> - add missing header includes (compiler.h, container_of.h, errno.h,
>>   mod_devicetable.h, slab.h, spinlock.h)
>> - drop stray blank line in ideapad_tpswitch_filter()
>> - collect Reviewed-by from Mark Pearson
>>
>> v2:
>> - fix inverted condition in ideapad_tpswitch_filter()
>> - mark the handler as passive_observer so that touchpad is not activated
>>   until there are real users
>> - use READ_ONCE()/WRITE_ONCE() to access shared state flag
>> - drop stray semicolon in to_tpswitch_handle()
>> - update comments
>>
>>  drivers/platform/x86/lenovo/ideapad-laptop.c | 189 ++++++++++++++++++-
>>  1 file changed, 180 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c 
>> b/drivers/platform/x86/lenovo/ideapad-laptop.c
>> index 8213524504ee..be890e82b9ef 100644
>> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
>> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
>> @@ -14,23 +14,28 @@
>>  #include <linux/bitops.h>
>>  #include <linux/bug.h>
>>  #include <linux/cleanup.h>
>> +#include <linux/compiler.h>
>> +#include <linux/container_of.h>
>>  #include <linux/debugfs.h>
>>  #include <linux/delay.h>
>>  #include <linux/device.h>
>>  #include <linux/dmi.h>
>> -#include <linux/i8042.h>
>> +#include <linux/errno.h>
>>  #include <linux/init.h>
>>  #include <linux/input.h>
>>  #include <linux/input/sparse-keymap.h>
>>  #include <linux/jiffies.h>
>>  #include <linux/kernel.h>
>>  #include <linux/leds.h>
>> +#include <linux/mod_devicetable.h>
>>  #include <linux/module.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/platform_profile.h>
>>  #include <linux/power_supply.h>
>>  #include <linux/rfkill.h>
>>  #include <linux/seq_file.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock.h>
>>  #include <linux/string_choices.h>
>>  #include <linux/sysfs.h>
>>  #include <linux/types.h>
>> @@ -210,6 +215,13 @@ struct ideapad_private {
>>  		struct led_classdev led;
>>  		unsigned int last_brightness;
>>  	} fn_lock;
>> +	struct {
>> +		bool initialized;
>> +		bool active; /* true means touchpad is enabled */
>> +		struct input_handler handler;
>> +		struct input_dev *tp_dev;
>> +		spinlock_t lock;
>> +	} tp_switch;
>>  };
>> 
>>  static bool no_bt_rfkill;
>> @@ -234,7 +246,7 @@ MODULE_PARM_DESC(set_fn_lock_led,
>>  static bool ctrl_ps2_aux_port;
>>  module_param(ctrl_ps2_aux_port, bool, 0444);
>>  MODULE_PARM_DESC(ctrl_ps2_aux_port,
>> -		 "Enable driver based PS/2 aux port en-/dis-abling on touchpad 
>> on/off toggle. If you need this please report this to: 
>> platform-driver-x86@vger.kernel.org");
>> +		 "Enable driver based suppression of touchpad events on touchpad 
>> on/off toggle. If you need this please report this to: 
>> platform-driver-x86@vger.kernel.org");
>> 
>>  static bool touchpad_ctrl_via_ec;
>>  module_param(touchpad_ctrl_via_ec, bool, 0444);
>> @@ -1462,6 +1474,159 @@ static void 
>> ideapad_check_special_buttons(struct ideapad_private *priv)
>>  	}
>>  }
>> 
>> +struct ideapad_tpswitch_handle {
>> +	struct input_handle handle;
>> +	struct ideapad_private *priv;
>> +};
>> +
>> +#define to_tpswitch_handle(h) \
>> +	container_of(h, struct ideapad_tpswitch_handle, handle)
>> +
>> +static int ideapad_tpswitch_connect(struct input_handler *handler,
>> +				    struct input_dev *dev,
>> +				    const struct input_device_id *id)
>> +{
>> +	struct ideapad_private *priv =
>> +		container_of(handler, struct ideapad_private, tp_switch.handler);
>> +	struct ideapad_tpswitch_handle *h;
>> +	int error;
>> +
>> +	h = kzalloc_obj(*h);
>> +	if (!h)
>> +		return -ENOMEM;
>> +
>> +	h->priv = priv;
>> +	h->handle.dev = dev;
>> +	h->handle.handler = handler;
>> +	h->handle.name = "ideapad-tpswitch";
>> +
>> +	error = input_register_handle(&h->handle);
>> +	if (error)
>> +		goto err_free_handle;
>> +
>> +	/*
>> +	 * We need to open the input handle so the input core invokes our
>> +	 * filter, but since we mark our handler as passive observer, this
>> +	 * will not cause the underlying touchpad hardware to be started
>> +	 * if there are no other users.
>> +	 */
>> +	error = input_open_device(&h->handle);
>> +	if (error)
>> +		goto err_unregister_handle;
>> +
>> +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
>> +		priv->tp_switch.tp_dev = dev;
>> +
>> +	return 0;
>> +
>> +err_unregister_handle:
>> +	input_unregister_handle(&h->handle);
>> +err_free_handle:
>> +	kfree(h);
>> +	return error;
>> +}
>> +
>> +static void ideapad_tpswitch_disconnect(struct input_handle *handle)
>> +{
>> +	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
>> +	struct ideapad_private *priv = h->priv;
>> +
>> +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
>> +		priv->tp_switch.tp_dev = NULL;
>> +
>> +	input_close_device(handle);
>> +	input_unregister_handle(handle);
>> +	kfree(h);
>> +}
>> +
>> +static bool ideapad_tpswitch_filter(struct input_handle *handle,
>> +				    unsigned int type, unsigned int code,
>> +				    int value)
>> +{
>> +	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
>> +	struct ideapad_private *priv = h->priv;
>> +
>> +	if (READ_ONCE(priv->tp_switch.active))
>> +		return false;
>> +
>> +	/* Allow passing button release events, drop everything else */
>> +	return !(type == EV_KEY && value == 0) &&
>> +	       !(type == EV_SYN && code == SYN_REPORT);
>> +}
>> +
>> +static const struct input_device_id ideapad_tpswitch_ids[] = {
>> +	{
>> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
>> +				INPUT_DEVICE_ID_MATCH_KEYBIT |
>> +				INPUT_DEVICE_ID_MATCH_ABSBIT,
>> +		.bustype = BUS_I8042,
>> +		.vendor = 0x0002,
>> +		.evbit = { BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS) },
>> +		.keybit = { [BIT_WORD(BTN_TOOL_FINGER)] =
>> +				BIT_MASK(BTN_TOOL_FINGER) },
>> +		.absbit = { BIT_MASK(ABS_X) | BIT_MASK(ABS_Y) |
>> +				BIT_MASK(ABS_PRESSURE) |
>> +				BIT_MASK(ABS_TOOL_WIDTH) },
>> +	},
>> +	{ }
>> +};
>> +
>> +static int ideapad_tpswitch_init(struct ideapad_private *priv)
>> +{
>> +	int error;
>> +
>> +	if (!priv->features.ctrl_ps2_aux_port)
>> +		return 0;
>> +
>> +	spin_lock_init(&priv->tp_switch.lock);
>> +
>> +	priv->tp_switch.handler.name = "ideapad-tpswitch";
>> +	priv->tp_switch.handler.id_table = ideapad_tpswitch_ids;
>> +	priv->tp_switch.handler.filter = ideapad_tpswitch_filter;
>> +	priv->tp_switch.handler.connect = ideapad_tpswitch_connect;
>> +	priv->tp_switch.handler.disconnect = ideapad_tpswitch_disconnect;
>> +	priv->tp_switch.handler.passive_observer = true;
>> +
>> +	error = input_register_handler(&priv->tp_switch.handler);
>> +	if (error) {
>> +		dev_err(&priv->platform_device->dev,
>> +			"failed to register touchpad switch handler: %d",
>> +			error);
>> +		return error;
>> +	}
>> +
>> +	priv->tp_switch.initialized = true;
>> +	return 0;
>> +}
>> +
>> +static void ideapad_tpswitch_exit(struct ideapad_private *priv)
>> +{
>> +	if (priv->tp_switch.initialized) {
>> +		input_unregister_handler(&priv->tp_switch.handler);
>> +		priv->tp_switch.initialized = false;
>> +	}
>> +}
>> +
>> +static void ideapad_tpswitch_toggle(struct ideapad_private *priv, bool 
>> on)
>> +{
>> +	guard(spinlock_irq)(&priv->tp_switch.lock);
>> +
>> +	WRITE_ONCE(priv->tp_switch.active, on);
>> +	if (!on) {
>> +		struct input_dev *tp_dev = priv->tp_switch.tp_dev;
>> +		if (tp_dev) {
>> +			input_report_key(tp_dev, BTN_TOUCH, 0);
>> +			input_report_key(tp_dev, BTN_TOOL_FINGER, 0);
>> +			input_report_key(tp_dev, BTN_TOOL_DOUBLETAP, 0);
>> +			input_report_key(tp_dev, BTN_TOOL_TRIPLETAP, 0);
>> +			input_report_key(tp_dev, BTN_LEFT, 0);
>> +			input_report_key(tp_dev, BTN_RIGHT, 0);
>> +			input_report_key(tp_dev, BTN_MIDDLE, 0);
>
> Hello!
>
> Tested-by: Alice Mikityanska <alice.kernel@fastmail.im>
>
> Seems to work well, without any "lost synchronization" messages in
> dmesg. There is a new effect, caused by the above lines: if the finger
> stays on the surface the entire time, and the user disables and enables
> the touchpad, the pointer won't move until the user lifts the finger and
> puts it back. Although it's unlikely to break anyone's workflow, I need
> to double-check that the evdev doesn't emit some invalid sequence of
> events, e.g., touch 0 followed by some movements, or touch 0 followed by
> another touch 0.

Yes, I see that BTN_TOUCH 0 can be followed by another BTN_TOUCH 0,
either in the event of lifting the finger after reenabling the touchpad,
or if disabling-enabling-disabling touchpad all while holding the
finger. Not sure if it's valid semantics, maybe it is.

In the scenario I'm describing (put the finger, disable, enable,
move the finger), EV_ABS events start being generated after enabling
the touchpad, without the preceding BTN_TOUCH 1, so the pointer
doesn't move.

>> +			input_sync(tp_dev);
>> +		}
>> +	}
>> +}
>> +
>>  /*
>>   * backlight
>>   */
>> @@ -1799,7 +1964,6 @@ static void ideapad_fn_lock_led_exit(struct 
>> ideapad_private *priv)
>>  static void ideapad_sync_touchpad_state(struct ideapad_private *priv, 
>> bool send_events)
>>  {
>>  	unsigned long value;
>> -	unsigned char param;
>>  	int ret;
>> 
>>  	/* Without reading from EC touchpad LED doesn't switch state */
>> @@ -1810,12 +1974,11 @@ static void ideapad_sync_touchpad_state(struct 
>> ideapad_private *priv, bool send_
>> 
>>  	/*
>>  	 * Some IdeaPads don't really turn off touchpad - they only
>> -	 * switch the LED state. We (de)activate KBC AUX port to turn
>> -	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
>> -	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
>> +	 * switch the LED state. On such devices we use an input filter to
>> +	 * suppress events from the touchpad.
>>  	 */
>>  	if (priv->features.ctrl_ps2_aux_port)
>> -		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
>> +		ideapad_tpswitch_toggle(priv, value);
>> 
>>  	/*
>>  	 * On older models the EC controls the touchpad and toggles it on/off
>> @@ -2018,8 +2181,8 @@ static const struct dmi_system_id hw_rfkill_list[] = {
>>  /*
>>   * On some models the EC toggles the touchpad muted LED on touchpad toggle
>>   * hotkey presses, but the EC does not actually disable the touchpad itself.
>> - * On these models the driver needs to explicitly enable/disable the i8042
>> - * (PS/2) aux port.
>> + * On these models the driver needs to explicitly suppress data coming from
>> + * the touchpad.
>>   */
>>  static const struct dmi_system_id ctrl_ps2_aux_port_list[] = {
>>  	{
>> @@ -2402,6 +2565,10 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>>  	if (err)
>>  		goto input_failed;
>> 
>> +	err = ideapad_tpswitch_init(priv);
>> +	if (err)
>> +		goto tpswitch_failed;
>> +
>>  	err = ideapad_kbd_bl_init(priv);
>>  	if (err) {
>>  		if (err != -ENODEV)
>> @@ -2478,6 +2645,9 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>> 
>>  	ideapad_fn_lock_led_exit(priv);
>>  	ideapad_kbd_bl_exit(priv);
>> +	ideapad_tpswitch_exit(priv);
>> +
>> +tpswitch_failed:
>>  	ideapad_input_exit(priv);
>> 
>>  input_failed:
>> @@ -2507,6 +2677,7 @@ static void ideapad_acpi_remove(struct 
>> platform_device *pdev)
>> 
>>  	ideapad_fn_lock_led_exit(priv);
>>  	ideapad_kbd_bl_exit(priv);
>> +	ideapad_tpswitch_exit(priv);
>>  	ideapad_input_exit(priv);
>>  	ideapad_debugfs_exit(priv);
>>  }
>>
>> -- 
>> Dmitry
