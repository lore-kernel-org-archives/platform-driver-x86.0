Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16C158599F;
	Wed,  9 Sep 2026 15:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967603; cv=none; b=l1LvASVV2R3O6RshGq72znQtPk9h0QkePUhBs1iNFwKv+atj1zPQZlcYjIwoNaPbV/r3y5Aau5PM2pWVNvPrjoRUXlFYUDfyTYquOsI+NqobTkMeuOJwEJrNx1B4Ndm7tiHvfyxmAMMMV+1phqIImjaBx1HCeSBpqfz1CrE57vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967603; c=relaxed/simple;
	bh=K+tPpcnxPlmZ+hTXPwaP9ZimJYGKFH4bAEXXpRkzTVc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YrXoDvKZ3fyEa5NfqFPWCM+ODF55Vkly9NRgfLEwBTL1gmtHeqpGVGnAqwbrv9VdDQx3slJYes5pP3eAzztmI1POyZkkRlEd5s5iA/rsJCPwbg3SvU4Im+tF16QtPZB+3n6adMh7LIhty+j8MEu1LQExffIg1rhlXOSSa6Jd9BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=jPUh/+lX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QR5qTOpO; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="jPUh/+lX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QR5qTOpO"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 0C79C1D0007D;
	Wed,  9 Sep 2026 11:26:40 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 09 Sep 2026 11:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788967600;
	 x=1789054000; bh=ZPxVBLa4CvLLJKe83NmgL2WWM/qbgnI7dmZEJVlqqrU=; b=
	jPUh/+lXlWS7tgD1oT6DJXiZZlrMPPDh4Tfv3XGlQ6umMqHXfdboh/PLx07ghan8
	4QwE62dAYUR1q6MzISA/cDbM4TegLJT62ZbbWH8zaFbb0V14YglZZKXlD6jXi17F
	REFDMPqNB7HCf/Sk15avPoWLdSGJ0Pxop9gM18KYf6W7LEeotJaTllglyrtaen2w
	lNZwl4W+g8KNjkWGdr7g3kTb2qn89TKaBGrJ9iUIDbqrvrVopVR20P0sKqWL4U5G
	re1LwBvJzQ6OMOHElksYq5Y0QqrkIVklIUXW6bcR4eSLkGHjE3frXwCPYDfiOfGB
	sg1X2cn2h3pd9oWIp9a3NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788967600; x=
	1789054000; bh=ZPxVBLa4CvLLJKe83NmgL2WWM/qbgnI7dmZEJVlqqrU=; b=Q
	R5qTOpOE760RM+igCpevlhsB+VYQEZ+9eUK4uAqjshYtPLoC8D++jxx0AOzD7fz2
	dKkjcqv9gL7noej2we8E8qCMlva+Dcu+MSYVhsI7myeItVyWXxlAC+B3k0wRp271
	oq6YrJ1kN/W3nL+j/vaY8Uu7B1CySWxBkax1ytLcOLZaZ/WEwFtJXRRv0qh72G0M
	L87CExw7Ln+GTvjxO4rFo9pG5OSLJs36a+QLNaZevkYpBqdJsbmDxSwTgVsxGKK2
	4OVP032ZfGrhKuMMcwqjtHJdjdW3NTnk1khY6fMhlrf1wVDhz/Ku6vCPgjmLWhcR
	VxltKqThjCKYWDdmeIspA==
X-ME-Sender: <xms:r3qhahvIthtSedIno5tfbZCxWQ7wXvvmGEfLe-JpFa4CZG1ggVUeJA>
    <xme:r3qhalRJDsPClNNgnFASnxwABWD1gGmUONYMmqw_xAQyfxpPB_K5vcmXPD-VCvkKe
    uvPCIye4UITa-6R6u_HwCQs9FYPQwXaVvgg9yULAqlKd-zybsVS9jB1>
X-ME-Proxy-Cause: dmFkZTE+w1Y6fFtlj5RcASlh8NEDiTG9A3MuPojYMbHu6zQa9usr/1G/TfV4grgL4ZYaJQ
    bi23o9l74Ulc0IEixroAqBfx3hu5U4dmtZAe3a/6eP1HaHZISArRLlCH7Ysy+zRDOsYcDn
    5U9hYAEQ93oUKoALTU+qWF6MF8zueCuDNoyKkxtSumVPOprRNBuPaHK8Iq8p2Q+2ObRRaS
    KdzEGVRW3WC5ntSruZ+Hi8o3wpG/ESev8yr4qkotmGAaZhcrVNyyVIrBh30ZkjPp6AHTyk
    NyD51Ii8qeRoLyr0yV3Scq6qYfN1jFSNd9KGKGi50Jr58AC0jbyvAC1lek7vv8L+/tTBHz
    T87H+/9Bt4cb5F2YqI3yAcCBj1EbUJJ+1zMKX4IhqA2szc7KVXyJ08WrQ6m2KNPWAoyJty
    I4xKuHHdYDCHwReQt3HC7hjAQcGXSSy851H7WFQT+9zpUdz3BJ4hdoVFr2/4vkWaV5p70/
    WN70rhsCY7jaXLxfQWIRaY4CDLmg3up9kGRtG48gvJ1RorOP4E5i0q1WUg3AXDJCkVrRte
    80J2aY9+KXOY6y3sLtDBeu2INIdQWhgn/kkgbuPuhHcoCubOa+Dp3HBfvRIURDEGF8Vrjz
    6fuMEbyzaCWjxDrwHGoqR0TjFwKb68SYEtEmiPcXMoRQCGEIaEgBcP1WJKvA
X-ME-Proxy: <xmx:r3qhan-Ws5rIRZbLCeRkXUOkS5YFxLKmh4V_Lmxrph6zpqaQ02uJTw>
    <xmx:r3qhakLkYiiwl1xepSniucUFZ1BaQQTYSBcsCCFgxani-5CT4cBjvQ>
    <xmx:r3qhalt4DX2vk8eoyxSakjHRYdvH6T4A0aML35mb_-aYqZyKU4i9sA>
    <xmx:r3qharDnja5jjIPpNBauHLJ01QkDMHk8_XGXpc8zhyOxlG1o2wKH9A>
    <xmx:sHqhaszSzhZ0cPbp4wBVTtyIyKJsoKQqo3Rf9sLxuzSqH1KWRFBURCby>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 7EFDA2C00064; Wed,  9 Sep 2026 11:26:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AR8LNQcE3F07
Date: Wed, 09 Sep 2026 11:26:18 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Thorsten Blum" <blum@kernel.org>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <254d9c60-d21e-4ef5-b70e-89dd18ff7147@app.fastmail.com>
In-Reply-To: <20260907090103.352995-3-blum@kernel.org>
References: <20260907090103.352995-3-blum@kernel.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Remove unreachable code in
 beep_read()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Thorsten,

On Mon, Sep 7, 2026, at 5:01 AM, Thorsten Blum wrote:
> The procfs entry /proc/acpi/ibm/beep is only created if beep_init()
> succeeds, which requires beep_handle to be non-NULL. Remove the
> unreachable code branch from beep_read().
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 1082c36ae723..069c9f1c359f 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5936,12 +5936,8 @@ static int __init beep_init(struct 
> ibm_init_struct *iibm)
> 
>  static int beep_read(struct seq_file *m)
>  {
> -	if (!beep_handle)
> -		seq_puts(m, "status:\t\tnot supported\n");
> -	else {
> -		seq_puts(m, "status:\t\tsupported\n");
> -		seq_puts(m, "commands:\t<cmd> (<cmd> is 0-17)\n");
> -	}
> +	seq_puts(m, "status:\t\tsupported\n");
> +	seq_puts(m, "commands:\t<cmd> (<cmd> is 0-17)\n");
> 
>  	return 0;
>  }

Change looks good to me.
I guess the beep_write could be similarly updated?

Mark
