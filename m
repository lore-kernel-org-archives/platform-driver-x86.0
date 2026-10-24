Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792812026;
	b=po8K+fcppUK381lRHdiVScHr7VbbaxURMV8FWkUS+zGdwnyUxrRkmgs4fhB9GXJHqY1k
	 8GvgSd4HKIv/ZhxEshWNZiAPTvmQCNjlO2/Wl53eCyVTstZ7DUPagS9bmW1hhLvIzS3YG
	 RLV11HIFyA1WLPGV4LwX7I2S9WbcbNhyqvAsI28sYRx1W1m2IdwQZp9gbZPcgeMM6MmKm
	 oJZzFshPINo39Vk8BHWYpyG6HwrkcNPjB4XmVNbnFT2DgmoFaisw9IiUR9cE9VuouKdDz
	 bX2VfUvbqM/cXh1+1UffnwDwXlHDIRkTPScbV68l2fwRDfx/Yd9fdQ/8rvuaJns5NJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792812026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=O+mF+cB3tiiukJFn6Uqz292YP2mX1XVgMOTaGiMv8wQ=;
	b=sQsdW1RBCmFRh5YhuQVXWCj63ZQKEGnDuEX1DjehzUwmVVQlh/4YxsVeGqLFDuZaobv1
	 xhapyN/u/1JhW8DhmWb1wsrXJiiAF3RgdsG9N5ILUv5j4iiXSDzXBzaoIc7fngNELtYVQ
	 H+jnW1UBBtQ46XfRcaIfZuyeKBX2MkZMOjm1h3x6PHEehFkq/sCMDC6iqEQGIahOe1oNV
	 Ggq5U628uo89rinkwp+M4Uwo1CzxvRRIHNaCXmRUm5dXr4Z4ZEd0UPZBvAoplI2YjwiAy
	 ut2EMwzA0qcGb605wEJO1P5FHU5SWs2Ie7Rc9zS3P9iuKHeNE4wJt9dq5WP7pZ/3qyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="mUJ5z/fM";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 55C18606A31B
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 03:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C18606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mUJ5z/fM
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-354ba08cfd1so2569365eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 20:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792812025; x=1793416825; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+mF+cB3tiiukJFn6Uqz292YP2mX1XVgMOTaGiMv8wQ=;
        b=mUJ5z/fMyGvCGEKRx0JYzUHWb9iula1KXvW69VCyCwVEfzElqrIfycrVJ6EM9q1jq3
         t/epYquxkBGGRxoiw26TqJPrEPxRrdp32ASo9t/eACy4YBCGHZ/2MPi+FKKOWKBtUKW1
         fbqsZIDRjuOLBkDoaG3OlFDsY61MPM3H/qeAjpmyK4AB6uj+HSP+3chKwCm4QKy+CbK7
         NabBO7/qaDyBGrRNHHes8vXUAmtt/nAnMLV32saISXLSQxLzxD9D1jHUWjU35NR/V1nR
         k0hzW8qvoZuL62Xk3J85/g0rsWIk5UeW1qu5mN52uh58Alo0F2hoQlxzRi10YyAO0rYQ
         TR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792812025; x=1793416825;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O+mF+cB3tiiukJFn6Uqz292YP2mX1XVgMOTaGiMv8wQ=;
        b=uAbQXrjVSPoaoc4RCQatiw0MLlGTLIZsm89cTV8qc3tZzi9IPo/tSLvhE28BiecqYi
         p0oR63wvkoS/Sln+/kZ0IAgmxUvXkwAcgrxaLeAKF/1EiVCRW1SIVjhUEjmpizkOWh32
         kRBV2/hOTO5H6aDW/znM0SFu+XZXFy1p3jElbWQxRwv8uHjVRTnt8vM/MEs715qLLklx
         QgVFUuacxyft7opIagu8giWFOHyCOKD0DZxsH7jQz3aLsAotgX3fDr0A+eWcWdWwzw4b
         rXmwFhU9QPGu/gnBzwAl+5QuBr2LnL79zhiVz6Y96vByC8z+EoRg8mcmxq5DJV0s+/Xx
         vQRQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5j7GZGlc81q+JXw2rHkLAmt/6RHiO37dJUoZbcajjU9SPMHn2hGsJ2anJfypLFMMzUUPD24VAKXCEsEKBR6F8XANB@vger.kernel.org
X-Gm-Message-State: AFq9FYKdyIFIloBtcE5wmmswlgUwrkIerdEkgebc/oH3mw4kMdQJUKFv
	JSTSsZ/sZFucxvxFPPLN0O7FunZKgXsBhRGREwODBQa5/JiJ5CjqHIYr
X-Gm-Gg: AYBFou03QklQ/10Xeb8K78XxhCtPMrooNfuJuvJaf80diYPLI/zQl2Rp+MN0SxEGSt1
	pQE+CSeLJ1sBJDpCcuhDXETXT+3h68SL/nsroN4nP0CexAokU5I1bGjTl+FAYGE1Z5X56V+PjjB
	tDwqj+4/x3TBhnZYzv2O9C1W6row1gNtHT+r1NNKG5AHPVAjkWReP9LC3JWPiwSdpYGZ+4Hy+NV
	GV2K5xacbdyUbsyoy4acnAUnU7+qlEE0Y60EJ6vjgRrCXbpNqwkB0nkLnlahV2zEg3EKQ8knsFE
	k8RgbmTeKS8hxIDkul0+jU8U7uvSU+2x5VQ3pOznIcNFxu3KVKGMNFnvmIeNxN719Pa7AxgSQxO
	88OnGGqSkb1UohOS8kY9oS3yZBBRV9eXBJMx3SiYb65a+cYj5djna8BIJtBV0S5R+tCsr0oI8u6
	WukDojqtFZ0FXfGl3BKbY8GxPRzNDbPisYPAXDm85Aipz4KurHNYZIy+KaquiW8N3s6JKC5LzQT
	1XBhIhg53niEbP+KoScsP7CFh/Yvhj/pGIknfvRpIlGNddiLSg+h6krbERlC3EeU/Y4efs9f1jZ
	nPpDGuhhCMAaO/CKF+9pakfjyn7B1RIIpXyz09ci
X-Received: by 2002:a05:693c:839b:20b0:365:cdcc:9f57 with SMTP id 5a478bee46e88-369e83547aemr1749426eec.4.1792812025253;
        Fri, 23 Oct 2026 20:20:25 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:493:cd31:1e31:5982])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d578casm2833958eec.6.2026.10.23.20.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:20:24 -0700 (PDT)
Date: Fri, 23 Oct 2026 20:20:23 -0700
Message-ID: <7b21717e80a7b779ab94d964ca40ee68@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Ike Panhc <ikepanhc@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard controller
In-Reply-To: <8cdbdcb893e2353e0ea2fe919e0c8a6a53f8b683.camel@rong.moe>
References: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com> <8cdbdcb893e2353e0ea2fe919e0c8a6a53f8b683.camel@rong.moe>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Rong,

On Sat, Oct 24, 2026 at 10:15:56AM +0800, Rong Zhang wrote:
> >  static bool ctrl_ps2_aux_port;
> >  module_param(ctrl_ps2_aux_port, bool, 0444);
> >  MODULE_PARM_DESC(ctrl_ps2_aux_port,
> > -		 "Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. If you need this please report this to: platform-driver-x86@vger.kernel.org");
> > +		 "Enable driver based suppression of touchpad events on touchpad on/off toggle. If you need this please report this to: platform-driver-x86@vger.kernel.org");
>
> By re-purposing ctrl_ps2_aux_port, you are breaking its existing users
> *silently*.

I'm not?

>
> Please don't do so, but rename module parameter to reflect the new
> behavior. In this manner, the existing users should at least see some
> clues in kmsg.

The purpose of ctrl_ps2_aux_port (introduced in commit c69e7d843d2c
("platform/x86: ideapad-laptop: Only toggle ps2 aux port on/off on
select models")) is to let the driver disable and re-enable the PS/2
touchpad on models where pressing the touchpad toggle hotkey only
toggles the LED in the EC without muting the touchpad itself.

This patch still targets the exact same i8042 PS/2 touchpad devices and
achieves the exact same user-visible behavior (muting and unmuting the
touchpad when the hotkey is pressed), just by filtering events in the
input layer instead of poking the 8042 controller behind the i8042 and
psmouse drivers' backs.

Anyone currently passing ideapad_laptop.ctrl_ps2_aux_port=1 on their
kernel command line or in modprobe configuration will continue to have a
working touchpad toggle. Renaming the module parameter, on the other
hand, is what would actually break those existing users by causing the
module to reject the parameter and stop muting their touchpad.

Thanks.

-- 
Dmitry
