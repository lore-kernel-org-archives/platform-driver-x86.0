Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD7852D2A1;
	Fri, 18 Sep 2026 21:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789767699; cv=none; b=osBbWWhC4sboi3s+0Weib7DvY6pCPwMUz7yJ7/guh+BagDLdSes6rIdBxxPE4LKq40/ATRBUl+zq6+KHW82BCUx3lMhMjijPlyyzKKABDfnToO2wp9tYOnYuNvGaKuarIEuhVxA7Tndj6pkpTerkRFPzLqSyXfJej+b754K5bZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789767699; c=relaxed/simple;
	bh=g2pNaqSjEUVUSnZ0XDVKFKgnJiptI9oCl+wn/0Eep/A=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=LxjgOSdChC5M4JzvpWkOshlXbWR7ypGmQZpcO/kHlGV/Yph4O/jc9zuTNP6hb0B8LOPYIH3bMx58/OEI9HUS83oVwbA2dZX1TpwXQRKcqkOuGsHjoO26vVWS1AoU/s9r0Jd+El1G6/aZ5FjFPhlggWpOENEbL+HXG7DQusR6sJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=pV6FJZrV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cl/EcELO; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="pV6FJZrV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cl/EcELO"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 4F3A41D0006C;
	Fri, 18 Sep 2026 17:41:36 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 18 Sep 2026 17:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1789767696;
	 x=1789854096; bh=V6a8DjpXuP1JaHpHQpka+djywQAWhu24+NeFfy31YWo=; b=
	pV6FJZrVOY2efp+YFo47R/2FjQrFjp2XX+8V0rUkh4XkPUSLMbJiPyAxjwfT88Kx
	k+uz/lS3aKr1OA0xZTgrqaWRpjBzq/6/QgsZQ6AMkeqWveUzn86/+3EJFLPnYOjJ
	5IPkxS92cacTKQs8W/drR015hFL0urme2TTPM2uVrAc11zIEK+Hy8WXKukSkvMPw
	Fu2YEiqQv3kavalXt5FCYdAGFucGPas5+coOhqvvg/inpeyCR6TJkau7sj2VZDxD
	Diyfs+cZGahDyVJDKadMfx5VHeEBWdEfOuBConpxzTxAnXXe/X8l6xiKTetxqfR/
	lTcuIt6XIVw/RfvJevGs8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789767696; x=
	1789854096; bh=V6a8DjpXuP1JaHpHQpka+djywQAWhu24+NeFfy31YWo=; b=c
	l/EcELOUH/KBYFpVMu2LxHEpIjoiX2HUiJ4dZktwVFtOC6XDmaJtq3cjw14cpGFt
	HcsfaeuAtdjzzsIsoJWg5M3QrX1WIqDChHS+8JcvInoWBQRCvy4HxUGDGS/01604
	54MPxYVgvb7RkdErospSYgHaGcw+MbS30u5aFjby6CoU7zw30dKHlz3Bbh82Z+Pd
	pWUq4nWTwT1QV3v3d6pi1QwhHNuyO8ZJxLKCQuO9G/ZLSAQM9LY5uZJiCV0BDBSA
	daBZI8ByRBVDN4m/FUc/msSs5qSjtn+h1HJHL5zrP4Ipo05MEBo/w8XDcutnRQsM
	Ey9ohSlDlnwDAmmrwOvtw==
X-ME-Sender: <xms:D7CtagMaO9XOtReKeQEjzTEP82pJQdlbWpgfTDIlrNv6f297yU65Vg>
    <xme:D7CtahyZ21O5xF2nSJIXhtyDytc42l0TOvBpsK3DALKYz6per3NLIByCHUmQHrdyo
    YWXXRDJ4MAwvLnGocubamvwjm2xrWOS3uxJHeebv_VMiPkGWKiJkuM>
X-ME-Proxy-Cause: dmFkZTFhfILZr58CCorNsiwKh84e3A84AdOSEPLZoX2XgQYFtC08YP8NwkBYSeMFs35k9d
    L6EuU7lDPskUk9ffe6Z/d/y+XfbmzO+stCFkrBH19yMZTpBVNp2mRMvzzDM8i80NS7BFfY
    rSy5yQ0tVqtWsXoQ2itK2tR/NsZkoYcGqOjTdaQTD6Px2uAQzyhtkYvJ0MbFvaSZ3frzwr
    zrywnDYMsHdh5uPsSx0F1oy/f9C9U19MdDJLvh5QMpkExOxIYUeIBViUor8Lhk6mO14+EF
    lHqTkoJ/MuMdlugQHinAS0SaRu/eBkEii+LcvJRFwbbqyUEZHna+6nfjdSR/bDS0vzR1dv
    ftWQZppy2V55o+naxZLf5HA03fG+Y+Nm4TKzEtXKa1QP+yXhWcmf936vWj7XCrDCjkKlwi
    qy0MdZxa1efa25IuR400fN9boqWzX1n3IQ8WGaaV/YJ9ufiihwU2Wzw6cFwy2PZ++PDpfs
    DYBtb837wNcHovYHQHzWg3lwS1N0MV0VXdo5aU3bSr5pQjT2aAQW0Kz+p5CBmWsYL6ip4o
    IaUu0SpPhEYYf/QmDiQXdzMAIV6nVjfE56f5fp/UDALAWWloCZciSbgUbxpj2QQSghzMfX
    WT0qf0jplrDvSXn9dFAmgRSlpjs5XKayvqvBs7O9zb73wEd5moZXPpumNdrQ
X-ME-Proxy: <xmx:D7CtapwcaWiz4Jivkk7Y2n3_eK50t99u3kpKkxU30-aTfd3U4bYxNQ>
    <xmx:D7CtaoVRrhqhgfggZsKJYEng7mCqBzfFxhVMHHhUpkgYLH8D5uVGsQ>
    <xmx:D7CtapjxngltwRqAwefsbitwEvy1VmAVCzbnrbx9pa306m3g_LdGpA>
    <xmx:D7CtaoCLxOLtHW4zqMBQolGm5iJC_RbI-Bah_3tRPqloKM-NL-PZhA>
    <xmx:ELCtapDa8ij1ghPnMOBiTPL4CeWFX3IWt38GJ_JS-p9fBK1XQw5MaXU7>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 6E1742C00067; Fri, 18 Sep 2026 17:41:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AcycUTG39Ir7
Date: Fri, 18 Sep 2026 17:41:15 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Navon John Lukose" <navonjohnlukose@gmail.com>,
 "Ike Panhc" <ikepanhc@gmail.com>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <3c345c9f-ca1b-4f77-9641-cb026704c6c1@app.fastmail.com>
In-Reply-To: <20260914134216.1295740-1-navonjohnlukose@gmail.com>
References: <20260914134216.1295740-1-navonjohnlukose@gmail.com>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Add Yoga Pro 7 14IAH10 Mode key
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Sep 14, 2026, at 9:42 AM, Navon John Lukose wrote:
> The F9 "Mode" key emits WMI fn-key event 0x46, which the keymap does not
> cover, so it reaches userspace as KEY_UNKNOWN and cannot be remapped from
> there. Under Windows it opens a performance profile chooser. The Fn+Q
> button already cycles platform_profile through
> ideapad_check_special_buttons(), so map 0x46 to KEY_PROG4 as a
> user-assignable key rather than cycling the profile a second way.
>
> Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
> ---
> v2: reword the entry comment and explain why 0x46 is not routed through
> platform_profile_cycle() (Hans).
>
> https://lore.kernel.org/platform-driver-x86/2eab84cb-6d2f-4ec3-9869-e2aa9c1d75da@kernel.org/
>
> Lenovo Yoga Pro 7 14IAH10 (83KF), BIOS QGCN35WW.
>
> Measured with dyndbg on ideapad-laptop.c and a kprobe on
> platform_profile_cycle():
>
>   Mode key (plain F9), 2 presses:
>       WMI fn-key event: 0x46, twice
>       no platform_profile change
>
>   Fn+Q, 2 presses:
>       platform_profile_cycle() twice, called from ideapad_acpi_notify()
>       no WMI fn-key event
>
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c 
> b/drivers/platform/x86/lenovo/ideapad-laptop.c
> index 8213524..35c13d9 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -1360,6 +1360,8 @@ static const struct key_entry ideapad_keymap[] = {
>  	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
>  	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() 
> */
>  	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
> +	/* Mode, opens a profile chooser; the Fn+Q button cycles the profile 
> */
> +	{ KE_KEY,	0x46 | IDEAPAD_WMI_KEY, { KEY_PROG4 } },

Just a note that on Thinkpad we handle the mode key also as a profile cycler so it's a shame these are different.
I personally would have added 0x46 to the code in ideapad_wmi_notify too so either mode key or FN+Q could be used. The mode key is a much more obvious way of cycling through profiles in my opinion.

In theory you could maybe use KEY_PERFORMANCE there so they're 'different'. ProfileD should handle that (don't think tuneD does yet).

Mark
