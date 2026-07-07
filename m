Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B165A41A798;
	Tue,  7 Jul 2026 13:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431099; cv=none; b=QLEaW/HbPu05I+yj9p0ZFG9tWM9ocevZAw+NBuPh9UFhOjXbzn5m7qegtjhGj+36QabYQSkDmK/UmFHZ94x8BsJV1XyGE9OuBtVjCmqOr6IZJL4FH7CO6t2s9uHy/FVgw3ZoLyyRKcZ0DOG9qCX4CdH7VvbJEg87Vj/rI5VHdiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431099; c=relaxed/simple;
	bh=voPaoZ8lJAJBHlEf9QBzCv1rXprRM4gBVT2tnLqBODA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OmoRG3Nbk3norKKLIsOrxxgP0TtpLMcsMipQtGBT8U/fQuGcdPo21GvHLtwIT/CZ7RzBDJGJkscHe8ZLGU3C0aiJIROAJuTQvowGsH/g15obL/hwrW9S8z9egq3d/wn3J1IcaLWiw95eJo5LWMuFcHrMgIcRmW2DlsdT98j7HJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=EUlb5MyZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lmIwiJtR; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="EUlb5MyZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lmIwiJtR"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CAD797A0100;
	Tue,  7 Jul 2026 09:31:36 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 07 Jul 2026 09:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1783431096;
	 x=1783517496; bh=I9vXKdi+Exzi7odJcoae65I/IxdEpr+TAy4tUVS61qs=; b=
	EUlb5MyZi7crj2RsweRgK1kP07dICSXFUx9/TaHQv6OeN8a9cg1BR704K+gYmweK
	SpbW48lyyAdQZV7T8lBy4W/ZXCsffD5snpOgDze2JssrRvnKau5d4/Jf6M5Isv9J
	/tX3QkTue2ly9sMg3b5GfHtjG0c4MEL6eg+ZbYrauC9xV/XUvvn3L2yvIbKpo3fT
	6luxg0qusHnV9bhvtiDJhi0gEH7q1WYwRmJnBvFhQ27cdps3yQrrtK16ZvsuQ6Of
	D2wQ7D7R5/ifpPEHSKpNmkWCl+hYE6nNrTTIoTD4BJjpispYVQqFOIgs/Da2lEKK
	Qtuu3yKqtH4kFvhJ3If7SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783431096; x=
	1783517496; bh=I9vXKdi+Exzi7odJcoae65I/IxdEpr+TAy4tUVS61qs=; b=l
	mIwiJtR9w/9yQoO5TDBG25lt3S+30le1tfLTdMY8h8/ydC2X1dxDUPGFG7VyKdnG
	j+gab1PWOnUzrky1wsMt5zXUD5A14XwKurj2dN3+fcd/zWHdGGyrqPtJ23ym0w2v
	bJ84eRiGoage8/iNWYLTQXoMpUZYJMSqrA03DxygmDe4Emc7mG8t5AP1pQ80aB6Z
	RQ/zr105mA3zf72WDwbddtlwe2yeOUJdp+ITWdtSyoD9cD1dm+MwrJlhlnl/I5w9
	oJlhxkwnFVrgVKjGaJJh1qGj4xcPYFuZ8l6DMN72lcwXgWYnDknmYzUBiAmK7ZvR
	ZHkF6ZsIYIfCguDr395nQ==
X-ME-Sender: <xms:uP9MannX7it1O7TT5wGtq4jU4beAuE7XuwbUV24tvwM1unx_gjafTA>
    <xme:uP9MalpIY7dhbaN4IFu1btlaSxsX3gT4qdnVe4oKJ8FncTagzc02HFiDnW_x_W_Wv
    sQhv7cAQvdDn5E3V7EiM9XicwZ5c7jMOrMSp5UvhU-hVhRBYdipeQg>
X-ME-Proxy-Cause: dmFkZTEXogtk798N496FkRJ/y7si9j0qLj/yB7ULRdCocIC78pw7Ra+Jmk5qMvrUy2mzWd
    4o5ckba9rtUizvVgSVIz22Fl/N5NsaphWgBVZNesOPVH2rckK3M5ZPAXpgu6yOLQ8n0zrJ
    2py/G6yc7TsRH/fkn0JjiMnflN3GrDT7M4P4opZ0PHy40Fo/hcqYnh+ySmd750YPuaMa/F
    QKhruQC8SbIl3VcjRN4htONegcRpdI8UnZeCS2i6JtU28G+BD5amQbkzEMSqzrRBG2ENDi
    CwFZBtPGf0XMpDG4yHQdH45VM9c000iPs9g6J6SeXznbqGuHd8E4fpX+HK927YAyHZiMoL
    9e78uELGiYmAfAoYZA82L+Ksl0R0qTkMLzqXRWvAJRQdY/hdS20tvjwEv1FoORz0pwUB1r
    wNwHWbXTFFuKJJutrgpX2ENiXBK/LNirIbUwrBgVMJVX8nYyCrOQkO/qFZR6EsjD2yRzuN
    pLCSoOeg4riZGBG65/xoeURf9dfc3JPHfFrSnXKFarkg2IQvOgdkxdHiqcWBbjypLElnFh
    L4LQaTbqEhmFLNYM4iwfSxi69rRwsKkMAjtVr4VTzBDc3n6IXBGuDjliGA9yKlRGFeoUGF
    PENiWJWKRf8vlrfSYBq+FxrzsXNvL/4JhR+0nib0BhzF83BlJyvqOcRSDvwA
X-ME-Proxy: <xmx:uP9MajGcQ4FaKtCjtIlgjWToNJWJDXPPgqlhTTFY3Y3CyUSx83P-4Q>
    <xmx:uP9MajaIvnOqCww85lzeVcnLLXganTsMXBE3ShqyGCgdlvVw5yD2TA>
    <xmx:uP9MavxaZjjo92L_hfaqN7eQzIPyw5bhfMUC-oaTnABEtPzcMJw2Mw>
    <xmx:uP9MatScpToIKvuteDHqUyUaXsHcbvOGHBa2cufo7DbMmJaLhUqHwQ>
    <xmx:uP9Maumr5pHtlMVWbGchqjMXyFPwKoS-rtjqdgvkI3UIMFekOBD69_yh>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 77CA62CE007E; Tue,  7 Jul 2026 09:31:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AY5QhGOBuWxZ
Date: Tue, 07 Jul 2026 09:31:16 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: goutongchen@uniontech.com
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>, ilpojarvinen@linux.intel.com,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, raoxu@uniontech.com, shaoyang@uniontech.com
Message-Id: <e314eebf-06ed-44e5-9cd1-35d60d02df8c@app.fastmail.com>
In-Reply-To: <20260707091555.71007-1-goutongchen@uniontech.com>
References: <20260707091555.71007-1-goutongchen@uniontech.com>
Subject: Re: [PATCH] platform/x86: think-lmi: Fix "Call Trace" error warning
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi

On Tue, Jul 7, 2026, at 5:15 AM, goutongchen@uniontech.com wrote:
> From: goutongchen <goutongchen@uniontech.com>
>
> The maximum BIOS password length returned by the Lenovo platform BIOS/WMI
> exceeded the size assumed by the think_lmi driver's internal static
> buffer, causing the driver to trigger a WARN_ON() during self-checks.
>
> Increase TLMI_PWD_BUFSIZE from 128 to 256 to eliminate the recurring
> Call Trace warnings.
>
> Here is the kernel warning triggered by the bug:
>
>   kernel: WARNING: CPU: 4 PID: 665 at drivers/platform/x86/think-lmi.c:326
>   kernel:        tlmi_get_pwd_settings.constprop.0+0xe6/0x130 [think_lmi]
>   kernel: Call Trace:
>   kernel:  tlmi_analyze+0x31c/0x640 [think_lmi]
>   ...
>
> Fixes: 651b57dd4087 ("platform/x86: Move Lenovo files into lenovo subdir")

Minor - but I don't think this is really the culprit :)

> Signed-off-by: goutongchen <goutongchen@uniontech.com>
> ---
>  drivers/platform/x86/lenovo/think-lmi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/lenovo/think-lmi.h 
> b/drivers/platform/x86/lenovo/think-lmi.h
> index 017644323d46..d643cf3b81b0 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.h
> +++ b/drivers/platform/x86/lenovo/think-lmi.h
> @@ -8,7 +8,7 @@
> 
>  #define TLMI_SETTINGS_COUNT  256
>  #define TLMI_SETTINGS_MAXLEN 512
> -#define TLMI_PWD_BUFSIZE     129
> +#define TLMI_PWD_BUFSIZE     256
>  #define TLMI_LANG_MAXLEN       4
>  #define TLMI_INDEX_MAX        32
> 
> -- 
> 2.20.1

Which platform are you seeing this on please? The maxlen for passwords from the BIOS is supposed to be 128 so I'm intrigued as to where you're seeing different. It maybe should be fixed in a platform BIOS?

Mark
