Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583B148595E
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 20:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791577625; cv=none; b=L6D8W0zf9ErtBitHQjBHcji18gyTP9QBo3Mj2CnCPfCu0zzwohzd3hrc6q6aCVZgxtSr8ZhsAsyRajXaMEJ+4tLssQtDekFL32Y7hzhrHynEOoCtxpQg7dscNGZSzbkBitrRAZwF6+ezNacZSwRJd87q2JjX9v0Mfvd4D/z4srg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791577625; c=relaxed/simple;
	bh=Ir79PCQmZFkIrjPdYWuVCGOxkxn5WC61zq1nNu/Mzpw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=LKvSDjmX+oEzzEU7IvFAKAjcDpAvA29532nT2oxouSelkRX8X4cXPPLRyMxVQ1n2k8g5QgtfbU+6NLxHM6UyfCzDoNFJGi/SeoW1hclOE79pIXjnAV8l65keJ1HcHwkncux+COILZ9gr6qey+DVfVD9bcKs74duKtnDEQkx4Ims=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=gUXX2jEB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E+J0ZNW1; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="gUXX2jEB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E+J0ZNW1"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 93688140016A
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 16:27:03 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 09 Oct 2026 16:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791577622;
	 x=1791664022; bh=dEtbHgfOwpFMHZP5AJ71Nyd/XYZeP8EfohungrCahtA=; b=
	gUXX2jEBa27uHL0omF+X2uDb06lNjWiebzg1cSX/g+z9yr50JTSZO0IrG25NK4fN
	Fq6md+lhHbe4eHAywY5vYx35207dHxxzn8DO4GCFK74AJcseOJTAx9n6prb2y6e+
	O6sJuJjKJrF/8Fs/4dKfzowhOYe6bvON3Dp++sfAPUPGMVxqZ5pzdYoqlrP65Gnt
	VTUNsfUDMnPsfUW/B2IHqLycaPQzngSyquwRbUU74B7VyqSqCHf9WPID3xrRvDgo
	tnDoCWAZis63IHNJX6WA3XHIRbtgZzNhnELEEJ8N/25d91tgUAtWPuoR9+p8LM1k
	wqN04Naaf3vrnLCyd9laRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791577622; x=
	1791664022; bh=dEtbHgfOwpFMHZP5AJ71Nyd/XYZeP8EfohungrCahtA=; b=E
	+J0ZNW1d7+Fr9A++9cpH7K/yPcYTRc62dyNnkarrFgI6hrTQhb06BKs/tGXgB0BO
	Lza6khQi4Hwe01i5ZEyiGcZWA6QrWQmgsohlrbx+tn6aCo/PPuTX6qXiBXaL8u/j
	yGG++zlbMI0hfYquXswCAjvQMvMAgxBmY4QchCW8ErkCZbEcBsPAD1t4p6syIeDd
	6aFJ4CIqB+Qxj+/fnhwxNyn5N7Go2oziTcdTkx2QizWTmLm6da0GW8RzduMA+5TB
	0qsK3/Ag0FaN8xWj65gf4i5svUOkha81G+U4lXhCYjbaT1tcZg4qWOtY49P140uk
	TSN7xaBAVO+kjCfqWRDRA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791577622; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:fidFr4/8D6l2UYDH43Zamlm7GrhO1cy5es3sYbD8Drk3IQl
	T+UaDvU7gb/KcTx+EOH7ipNtD+tiBtF64IujGoT9DwC2Me0igJ22g8zTavdcfOoU
	XuUcj0vWCaZvMheDAqcbd8oVJYhdxfE03Q0JUouKEJ1VB5+ayT7zdCGZBuNgq8oP
	7G+7D0TrP8Lvrzi7tS2kuXwuGUf/BU27meoJAksVN5BUijT5YZtz0GNQHOcA6Fb3
	9R+Bk2uwkW6TlbWMPzXfeyQKMn77Jgk9l67VKzH0m6JrjTfZHV+L7zfdyXeAuzz6
	Mwf26bjRyltUwyHpaGb4XU3SFAkiRyW+zycG/yg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:oWKh99HoBR4tNxlO3YuxUEZfMe0K6blkmptBPf4yoCE=:Ir79PCQmZFkIrjPdYWuVCGOxkxn5WC61zq1nNu/Mzpw=;
X-ME-Sender: <xms:Fk7JatjH1uA-pyujPbFy3frWzJn0XOWbXM22YRUFYXvYLDvz9_bcPg>
    <xme:Fk7Jas36rRlxgK4kifrrx3eU0O0x6i1QlP_JuIfD4t508eQTSIZy3VMmcWazU1XeB
    _qQOp1XWbJprqee0XTzSRAABHbOCeB0XmYwa5JquCBK4osTK3q9RTaY>
X-ME-Proxy-Cause: dmFkZTE78mPxJOrD85wk9mHUAJdhrHXRf6cJoQtlhzUgUZ+tzxwkYmmZOC6/ovWwxRX/hA
    ZtHSzWj/on8K46ctfhNGTLhewIvk2CZKiRNT/XAUiGa1q2vjZmC6YF0GUZVn/fW8wcFzeh
    9R2G8Ef2c2z9uPC+2I+MsMgxxI0pIsNKxfPMEfk4tBz6gGAbFjZAwZczTZ1N5CIctEeVy+
    tgJIHoWkMVDNLpKJNKzCeGYd9987SeM/kl9nxOMBvFutO1qgHVzru7UWlZ/rfN7mq/uB8t
    JH+MwwK4eaxuvbr/wQ+hEJwFMuNz1MAdRb0nlumx+v51DrqthIItdFdrtQh68a4/AQtogc
    Mjxgj6tmJqQIa6Gy3pY5mWbAN15I5GUnNhutGhMxo9I+NyDyPR7dKyXLrVjyEnZKYMTprn
    MpNkQ/J/7drTach7xBBS8G2BEHBLfE9ytJkrdxSf2/UyjhAFCICWhoNiR/ppHgMZYjCMzO
    okIsfynmTYeoOGv0gaBbLPgn7hGw8uijy5vMwih+hzsbWjUgJnR62H9X46dujyx1nvzekO
    7zIqHj+4nJ07ryKYzIrMnqMpGm2P11f8HtMGffL94qnQgoDRcQHwSahUBP0k1vHDXm4/e6
    ropedH0pjeMVQYowXIg6qA0crkjDXAz1L7TzvOZkrfdtWHS320GWTN2t32fw
X-ME-Proxy: <xmx:Fk7JapBNtUqzGJPrNgbkcxx2njRz3y5Uz5SDChwEb4yj4mJxWs56Yw>
    <xmx:Fk7JakFNbYsUKcWh_wA0W9mJ7EAVG3yv1thmwSErTTwrmp2Qxje0dg>
    <xmx:Fk7JapCDhJrp0mMLVyw_Hx42aQLvwt_OXUdFrVqZ3hUZeoHTXI1kKg>
    <xmx:Fk7Jaqll1DEiIxsZVgmTRh5Chug25o_iZuIb2LJZUY7U3y5w4S69UA>
    <xmx:Fk7JajuJ2p4GwlBI1XlxmaqsDjBe2wFSNsf9BdumkfYX_Z-pkDlEGkxU>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 09AA52C00076; Fri,  9 Oct 2026 16:27:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AcJjLO23Rn-3
Date: Fri, 09 Oct 2026 16:26:41 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Armin Wolf" <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>,
 "Navon John Lukose" <navonjohnlukose@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <7c50bc30-34c5-454c-89bb-1ec0b1c8a6bc@app.fastmail.com>
In-Reply-To: <20261009-lwmi-wmi-new-api-v2-12-402828382679@rong.moe>
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
 <20261009-lwmi-wmi-new-api-v2-12-402828382679@rong.moe>
Subject: Re: [PATCH v2 12/12] MAINTAINERS: Add myself as a LENOVO drivers co-maintainer
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Fri, Oct 9, 2026, at 8:53 AM, Rong Zhang wrote:
> I regularly review patches and resolve bug reports posted on the pdx86
> mailing list or the kernel Bugzilla to improve LENOVO drivers (including
> lenovo-wmi-* and ideapad-laptop) along with Derek J. Clark and Mark
> Pearson. I've been submitting patches to add new features and fix issues
> on my devices, too.
>
> Add myself as a LENOVO drivers co-maintainer to reflect this.
>
> Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Link: https://msgid.link/782FE636-A06A-4E12-9563-786374805947@gmail.com
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f53047aa8d3c..fa576b4b5919 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14808,6 +14808,7 @@ F:	drivers/usb/misc/legousbtower.c
>  LENOVO drivers
>  M:	Mark Pearson <mpearson-lenovo@squebb.ca>
>  M:	Derek J. Clark <derekjohn.clark@gmail.com>
> +M:	Rong Zhang <i@rong.moe>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>
> -- 
> 2.55.0

Sounds good to me. Thanks for all the work you do on these platforms.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
