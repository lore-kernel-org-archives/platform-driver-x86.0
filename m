Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CD5424641;
	Mon, 17 Aug 2026 15:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982067; cv=none; b=sYap19if5bE6APpGe3Yl9W7ZdkIcxLTFDNxTEYOLQp8KiAQPKLM0K+8sv/uqzSaImzdTzEc9wT9VYGif6GPxue/+K3gEyNJ0mSAutR4UeSYAQ9JAXCF4ZJ1TFDsgHKNOkC7U2k9/6g/dMxkRAuHY5PpSizopPEHHM/4+nuuQj7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982067; c=relaxed/simple;
	bh=rlKU1STO65Vr89EfoCiOsJyABuLd7M4LiJ3AHxSZNB4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=C0KY+LaxLCZ5rF8eRNHvdB0ArejqEOE8INQ3Evm8wcCoaWzyTgWoykXzXpnAs/8X/9BJ+T85nKGR1b7MQj8YD6Kh8dlHcqlIQg4WWvNa8H1ZbNH8qNDQHj8rFKvCOk0y5CdFNfZrZFWG5UF9PPF19NV2C/8njdIi5Ooe+m8/1P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=fei9Q72v; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NQa1QrDp; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="fei9Q72v";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NQa1QrDp"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 462D41D000E0;
	Mon, 17 Aug 2026 11:54:24 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 17 Aug 2026 11:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786982064;
	 x=1787068464; bh=8mWi9/vP2y51P4L8dS8XRWvlX1p2dBDUzkAAhEf7gzU=; b=
	fei9Q72vdW/NAupa5tLkjuCs8bqWKgkbcLeQvD6t2asRDcHUWvRcq0iwfdIqUGSK
	SUmMlyVa5ryACoG6wIVOa0ftDjNoc3Dox9zjHxcMJGOKXyg7W+PV4hoZg7X1AMQc
	G3ar1LADzgtDkK3ED+Epi1gqc9sYStL8B51IhaS2v0qRXlopFaZKwLTsdD/wJo9c
	Nj8AJUZgn4UpujOAiRhSRdAT/zKdNlueyJdY8CZEBkeIsdWr5lUzDU5wRbMlQsPh
	RTGKuatxZ7l4tCUv28ZuOfdPEhe8pcSzvUSEk2TApP6Tc4jU/6uyKjm5XqGpuMy8
	ZKe77lVA7E/LOvb83qmHdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786982064; x=
	1787068464; bh=8mWi9/vP2y51P4L8dS8XRWvlX1p2dBDUzkAAhEf7gzU=; b=N
	Qa1QrDpcUBH+UV4Pa3UdTwyERQb5CMEQxuXEZlgfvnjt3/4+D9OTPLOcPOF3zhsV
	jXFbvI3tx06zAwrOS5bcJpgyfRtWpevSFfgKx2pguG2WPujxqQO/tw6XNFALazsJ
	hg1BnV/GbwJ1nGx/LbXXJCWIuWxv0AgHxfc0Ri1FHJh2fvWOGu16ghqqwUD3G7W8
	xi301Q7f8cQOdTUAWRgQ3z0O2N2z9HRLWHBWGILGnrZUGr5t1FJUPYzVd1FVtoLh
	8fTfQVYnotJacBIXfBjNXlcrAKi7drsirvR53NszDamQSac9wgvJaIKS6Ozp0D0F
	Wz16varS4Zgp3eyCA+GKg==
X-ME-Sender: <xms:sC6DaqeMp86Sf9mfAtCKSJVqI6qqw542Uz9JJpAdavc10UfZojRFqQ>
    <xme:sC6DavDAN91RJYF7_HeheA9_Ef99Z6VxBpEp2Q1c7f9--TMe-tPPpoxRkWTo9Hctu
    sDhmbgHlx3IvIs_YSd4rReSefsGuvL88-hYUDEwvbpI1FNvXIqdzQQ1>
X-ME-Proxy-Cause: dmFkZTGKOvP91NzHcuyoEODw5DByGlAP+nw9xqSNlWo+HBDfy46x4iWUl/ptM/ckkgYOg2
    VXDDT4cv9frSavx3df4jtyieWokb+mUgDQdiHbtvUdTOkx3Afm7lWyHHpfkj2iMuKZsgq8
    wq1w+H99/TnYKQcqK6gYZufK09DuRIePMg2ikZ9TkbRVSoqpcfcBKPrRz6ORsoOcqQSGql
    fJU6RWP4duK/PlYZPwNrVudGhsYi/F7eTzYZol/NbXrhgnSANkbRLl1uh9RQ20KkLXHxfa
    gPOA4eiVoLRpfb3Ueq4zZxoW7sd+WY6NH5p7cRXxZBeIYjT8fXxP7Tb4+SqPmnI04r90n1
    k2nzHQcGffuijSVnoTgGVwuPTugJ5WViSOH8lx4/0oIzps3N3hxPZT7ErNAqVUe3OFpS3W
    5w4I97VhhTCDjCXtw55DN+RxbILDHLm/+zuoKyDs8LMpx0dse6WAwEyimX+HIDiGa8+D/g
    M2tcheOcGBrFdzp1ssLRNTfu0s7MshS9421am50O33uFhbPYq0Eg1bQrCRT6U0bJjKexp3
    Q7MtBfP93sd9avWGt3bEMQbu6MZ+9hvLEjBX2vFIhRgtVQRPr17+y+1rrLAZ0oFwyHXzFk
    b/RACGMe0kJAQlH8k0OnBH3bkcaqnqABwFouDu2A414wTlMg/XRrimxtq0KQ
X-ME-Proxy: <xmx:sC6DagC0zOSwd_Rd-ioPfrxGmuCKfHEnzJxFTH6onlwNVHefntw7Lw>
    <xmx:sC6DakyorkMHgtZZwmoMOcSqB_p-u5HcHyvAivm9NM-n4-cUWuvvsQ>
    <xmx:sC6Dal3M5bVl2a6BArRHurdWATW4bJAUP85l7XZyfZxoIaT_VMUTzw>
    <xmx:sC6Dasz_3oLl_PJR4doeFxnPyyFqwCgj8tGsqX9C5b1Av5aejE56dA>
    <xmx:sC6DamGyf4Yg7ZY8y8lYMMHK9m66MooQNjPwBAA52xcHtIZF_c0kUMfO>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E08A02CE0072; Mon, 17 Aug 2026 11:54:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AFyGiLp7Vb0k
Date: Mon, 17 Aug 2026 11:54:03 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Thorsten Blum" <thorsten.blum@linux.dev>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <376a733d-b51d-49b1-991d-631019deebd6@app.fastmail.com>
In-Reply-To: <20260815093431.98950-2-thorsten.blum@linux.dev>
References: <20260815093431.98950-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] platform/x86: think-lmi: Use ARRAY_SIZE() in tlmi_errstr_to_err()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Aug 15, 2026, at 5:34 AM, Thorsten Blum wrote:
> Use the ARRAY_SIZE() helper to simplify tlmi_errstr_to_err().
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/platform/x86/lenovo/think-lmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/lenovo/think-lmi.c 
> b/drivers/platform/x86/lenovo/think-lmi.c
> index 26ee6ab34a15..81ab6aafee47 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.c
> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> @@ -249,7 +249,7 @@ static int tlmi_errstr_to_err(const char *errstr)
>  {
>  	int i;
> 
> -	for (i = 0; i < sizeof(tlmi_errs)/sizeof(struct tlmi_err_codes); i++) {
> +	for (i = 0; i < ARRAY_SIZE(tlmi_errs); i++) {
>  		if (!strcmp(tlmi_errs[i].err_str, errstr))
>  			return tlmi_errs[i].err_code;
>  	}

Thanks - looks good to me
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
