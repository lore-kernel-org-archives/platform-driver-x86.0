Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794831607;
	b=uoFiRnH823pleJCreSezMlH727b902u52so+fmfNDGW6HXv9wALPCvWTrRVCkz1ko0NR
	 N80rmXmlo/+wPPqlMZGgY0gBVPuBGOd0615iLwbOWtq+7IdAsJSJIa5ZlJQLOHGNyw7Ic
	 VIhijWu+ckCb6fZaYR+sDpX7itnZPFFFyQjDeIpzJLApSsMV47xFh8urf6Qy1mZmSPQYf
	 9N3W45mTYh7VlNsCv5kPtaZ9KFsdPSFPB9Q3IK8Fv6qsMqqcss/GbzB3wYO2S+GJQzU6Q
	 7N2uxct/S9lSowlu+2w3CieLHL+mq6FpeanoDNEN9hpDBVqPpWas7S4la1KAYTPGegA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ThqMa+Cp5rT1AxTJtuViQctpO4Z1h4bDlUNe0sOzkYo=;
	b=zsMtqpXfaf7BcmWUKjGr3oNu6dDY+mRDYMayjUVuaYHCV/7kPTgPA1M8yocVRSZ3eFFG
	 8SG/UbFjnfopGpuHlMoDrLY7BUoTYUJTSZu2fjAUIqKqRZXWBsqg5ZoiRHtUnf8cm70l9
	 HY2WhLcEM8bfjoIzyTRi58wng4h6NCIDiMaO1GTDex31cvywwQGs6ipDibPnbvfHweMIw
	 bLC7+TWICi77zgC4UbfgTC/3f0hGg0e+DYhSJulDea3PPSu5W/1S2WIZ2hADz9QK64Nrh
	 pfEe9lMraRufrn184E5p+KKgrA79fP6eUyriyIt531DHFQHzdEsnz17CPWJpzS1+AXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YP0q+c5D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025B7606A323
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 12:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 025B7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YP0q+c5D
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380c28f9e35so34842eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 04:20:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794831606; cv=none;
        d=google.com; s=arc-20260327;
        b=OzL9UwlbS2eU1GDsRoC5i6UvTdIpI0455jeS0A3KVXeh7YlfR8w7zw3z6PpQRPn4oN
         RjTKm4fxM+JFdeGp6pbj6ffS5wyk1qgTs8VM93+XGaBfqkDqUi8miDfNaO06jBJjvOSo
         zF3fNIjp7rrtURI70Uo2kw98feGGOP0wuy06Tj5ZFri1ZF92kQL1J7BA+df09LK7G1d8
         70BEil449KWWzi09YyuxyeCWWGX0Rx4juNL9IC7JaNTZ40lFXsoPSjH4f9vOSeAOdQjf
         RV2/L+Js6UJBuobv7oY27wuJyBNDmy4LkeMfNopuMcTTOwHiHLBvGtdPY1HUp8l6RhsX
         dY/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ThqMa+Cp5rT1AxTJtuViQctpO4Z1h4bDlUNe0sOzkYo=;
        fh=Il7rl7xgGhotfqhXH9A/ximQEKFsVNavQSgFjYrO7m4=;
        b=bSaWL1FV/HQQZNKSvc+QIUYQb1vrUqcQ4SL0llGVgoPqBRRl4F2/GxSsyb+MG8bN7K
         1BuD7nNiL9Md8//IJdbFZzUdMi8uchSLKT3+/VYTwN5BhJvrlq34hXxHoOEWsnqaZHX2
         8kuCroNdCL9X0VX7dCh80Ox5ZyCtz1h7lpak59Ln5zj+fp5caPUA5VJ8dotNt31OijUQ
         DS5cKpBRGCVfIurC6OwQtc6s5GA4IIkcqBo3SYOnfZvc/8KsEAHDYUS4KJKygfcqcMGc
         J2vYHg+Hb+qz9FnUDrwurhqxnCKoDxEGMOcAPqrL/+Wxoh516ixgvYosloxfO9qWSm9P
         IRzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831606; x=1795436406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ThqMa+Cp5rT1AxTJtuViQctpO4Z1h4bDlUNe0sOzkYo=;
        b=YP0q+c5DiPP+pGsJld3fJfzdtEhWj1PKCzybA7s8F54w02EiZAWYbIiLlBag3EaQLK
         znrv4XXPNYdvd3hpesHSQHBr6j6PqScpc4Vy0vRT8tt+YCEwbBP40lfrwoHlMKmk2Bnl
         kekCCTJQ9DnVrxUv7a6gAb2wOGWEGz/6mJvPkru+9ib5BB8hxFn33elEu+hr29cGzGxO
         YtTzXUwz3CVbacnGAMtywLjA6jrDtV74ZAcW/mGOWvZlUxWCHNt9xpsmeIkQlfy6RxYv
         Bl0qipYTYDlUnuG3LKfwG15aG+ilexeUNl0JkVNbyXY37nXP2SrpOZWUQ9BTq6lEqoHE
         qwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831606; x=1795436406;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ThqMa+Cp5rT1AxTJtuViQctpO4Z1h4bDlUNe0sOzkYo=;
        b=alp412wuJEjtlv/SKuq3C5p9biWcHGy8xDpBzEn+5/vBCYKiDeJSxQ1Va+UnNhvfCy
         rYniC5mU6BU+P33DM3DRvVKNaW0sRdfvXogT/UvZKggB51lqLhqQUoBa5WHdxy9IVGJZ
         LPzopblwRlfz2eeIJ8sfNe9SWC/UU0RCiep9UsFU/fw3pOLcl3SS6z6y1PWm/yUR6mNZ
         fH9Drqyv4gDGZaCU7SHpqMAzOZNrmmwKl5WBiLlEFigXzizjPUxrIgDd3BtBwUw0e3Ui
         y4UuaZ4t6gkuaAuxz6w6tTuidpcdpAdigBZbChTpggEp4vfa/ia70DuklVLhjKpcnjGk
         DW3Q==
X-Forwarded-Encrypted: i=1; AL+hErHRqiFHHwE7p6p5apFxCSvRs3sHAOvmi+LLaWZybT4f7raOJJL1RcTvcBSSZ8QgdP5cv2DQHGEF2pVJWNehG4Vu1yP5@vger.kernel.org
X-Gm-Message-State: APuU4Z8QVxe4cI7lwVawRVCK1e0+Rp13OQUS+mIYyscn9WVL/bjmOSi/
	nK3LTGjovJg1yPI/AyDtPHbFFRlCK66r9ejCy5AOEn8/MxgjH/vCdAoJoGdtew8vTpdWvQXimiZ
	Va6DNnDS60h/8ugnJe9FR/2IuTpgtjR0iHtKx
X-Gm-Gg: AZFdTZcdCFlDX6fOcUBw3VJxiKkZuVz5kMhp0DB0E2Y/1CnQXF/rnuR8+2pm6H8ALFc
	IMyEcgYd2RRMgTvulJsqV/MEVjsJEB7G5bmt75goc2GPOM9fj74Jzt3wjSzjHynKfBqc8pYllLh
	8Hpv0hTkgSZ8xpba/dy1WbTf6YxTQLxrTAIAfxjP3H8e3QPFC+SxMEyUsxmii6QJxs3xXwgOZCJ
	7ge810Putcb4bsoPs7EkiHN3hMw+lzyrAUr+SrApvuy5VjZhHH1Op5Ag/RMWqJpNNbTgCcq2hCK
	Xjzhw8jg6soxERtMMrS15WAGkAYcvoNeBL0bld7LHUu8ODf68rMLa6lkwC0D0JG9IOx0J5g75+X
	ud7UhyqDNS5LuXjZxhOuXDqVOc2lq6GVxHX+HeVWK61DVvDE0oyvL3kmRwdIk307BHbp/CPORP4
	Ukdmir4oS9CJDnow==
X-Received: by 2002:a05:7300:c00b:10b0:36a:647b:2d7a with SMTP id
 5a478bee46e88-377db7c8ac3mr14514561eec.0.1794831605962; Mon, 16 Nov 2026
 04:20:05 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106043621.1903211-1-hj351016@gmail.com> <20261106074316.2204392-1-hj351016@gmail.com>
 <6857ee54-81b3-4c8e-106f-d5c871f44375@linux.intel.com>
In-Reply-To: <6857ee54-81b3-4c8e-106f-d5c871f44375@linux.intel.com>
From: khj <hj351016@gmail.com>
Date: Mon, 16 Nov 2026 21:19:54 +0900
X-Gm-Features: Aa3M54pVVjYR42whJPeh4iY9-bRtomZTkPyisKrDYdR3jFietSTG2pxyOQFxoak
Message-ID: <CAGr5VtO-tOv5GMMfbipQYYiAEbQOZ882QFL7QWZ=9HRt+9iLMQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger:
 cancel work on teardown
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, v3 uses devm_work_autocancel() now.

I put it after devm_serdev_device_open()/devm_pinctrl_get() and before the
extcon notifier (not at the INIT_WORK() spot), so on teardown the work is
cancelled while fc->pinctrl and the serdev are still live -- the worker
touches both. Details in the v3 changelog.

2026=EB=85=84 11=EC=9B=94 16=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 8:30, =
Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=
=91=EC=84=B1:
>
> On Fri, 6 Nov 2026, hyunjungg wrote:
>
> > From: Hyunjung Ko <hj351016@gmail.com>
> >
> > fc->work is scheduled from the extcon notifier callback
> > yt2_1380_fc_extcon_evt() (and once from probe), but it is never cancell=
ed.
> > The containing struct yt2_1380_fc and the extcon notifier are both
> > device-managed on the serdev device, and the serdev driver has no
> > ->remove callback, so teardown happens entirely via devres unwinding
> > when yt2_1380_fc_pdev_remove() calls serdev_device_remove().
> >
> > devm_extcon_register_notifier_all() unregistering on teardown only stop=
s
> > future notifications; it does not drain a work item that the notifier h=
as
> > already queued. A fast-charger extcon event that races device unbind ca=
n
> > therefore queue fc->work just before teardown; the work then runs after
> > devres has torn the device down. yt2_1380_fc_worker() dereferences not
> > only fc itself but also fc->pinctrl (pinctrl_select_state()) and the
> > serdev (serdev_device_write_buf()), so it must be drained before those
> > device-managed resources are released, not merely before fc is freed.
> >
> > Cancel the work via devm_add_action_or_reset(), registered after the
> > serdev is opened and pinctrl is acquired but before
> > devm_extcon_register_notifier_all(). Because devres runs cleanup in
> > reverse order, teardown then unregisters the notifier first (so it can =
no
> > longer queue the work), next cancels the work while fc->pinctrl and the
> > serdev are still valid, and only then closes the serdev, releases pinct=
rl
> > and frees fc. This closes both the re-arm window and the use-after-free
> > of fc and of its sub-resources in the worker.
> >
> > Found by static analysis / code review; compile-tested only, not
> > reproduced on hardware (requires the Lenovo Yoga Tablet 2 1380 charger)=
.
> >
> > Fixes: b2ed33e8d486 ("platform/x86: Add lenovo-yoga-tab2-pro-1380-fastc=
harger driver")
> > Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> > ---
> > v2:
> >  - Move the devm_add_action_or_reset(cancel_work) registration from rig=
ht
> >    after INIT_WORK to after devm_serdev_device_open()/devm_pinctrl_get(=
)
> >    and before devm_extcon_register_notifier_all(). The v1 placement
> >    registered the cancel action first, so devres (LIFO) drained the wor=
k
> >    last - after the serdev was closed and pinctrl released - leaving th=
e
> >    worker's fc->pinctrl / serdev dereferences racing freed resources.
> >    The new placement drains the work while those resources are still li=
ve.
> >
> >  drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c | 17 ++++=
+++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger=
.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
> > --- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
> > +++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
> > @@ -148,6 +148,11 @@
> >       .write_wakeup =3D serdev_device_write_wakeup,
> >  };
> >
> > +static void yt2_1380_fc_cancel_work(void *data)
> > +{
> > +     cancel_work_sync(data);
> > +}
> > +
> >  static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
> >  {
> >       struct device *dev =3D &serdev->dev;
> > @@ -209,6 +214,18 @@
> >       serdev_device_set_baudrate(serdev, 600);
> >       serdev_device_set_flow_control(serdev, false);
> >
> > +     /*
> > +      * Register work cancellation after the serdev is opened and pinc=
trl
> > +      * is acquired, but before the extcon notifier.  devres unwinds i=
n
> > +      * reverse, so teardown unregisters the notifier first (no new wo=
rk
> > +      * can be queued), then cancels the work while fc->pinctrl and th=
e
> > +      * serdev are still valid, and only then closes the serdev and
> > +      * releases pinctrl.
> > +      */
> > +     ret =3D devm_add_action_or_reset(dev, yt2_1380_fc_cancel_work, &f=
c->work);
> > +     if (ret)
> > +             return ret;
>
> Why not devm_work_autocancel() ?
>
> > +
> >       ret =3D devm_extcon_register_notifier_all(dev, fc->extcon, &fc->n=
b);
> >       if (ret)
> >               return dev_err_probe(dev, ret, "registering extcon notifi=
er\n");
> >
>
> --
>  i.
>
