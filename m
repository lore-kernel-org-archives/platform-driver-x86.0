Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78E41F37D6;
	Tue,  7 Jan 2025 15:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736262818; cv=none; b=uITjCDWiMMy2138Igy7jRpgwPQiXKAIomK87/TFLfZVo3E93SsXLuFbweo+CtYvceJFHSrTsFQXFtJedoKwO747d5bBD1ySmPYZwgzyNfRM5b+EAB5LkSa+7Pa7WZP6tMJ//cYwRVvQrglG0mXf/e0yXXWafhLWZ2M6Kd/QubBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736262818; c=relaxed/simple;
	bh=yY0SEnO1GZ8JGUjFua2jk06MhpxnWpYaVFuthE8MgRg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GyVmLlT+iROTr7Gp4sf0mvmuubHieNNZojcpN/jMt4x6VuLcYXwd/wfGxx4BSnUAlrt/K5e2C5OFBtdzH8FpGSyt0c1G3v33bHRzK9+nbqCEiyBPvfewQl6vb9STXmqdBzsKivGAy96MXk/3SwnId7LYBes0HHbtPKAioi7lbPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=ZLgfsMOo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bhh4/bz6; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="ZLgfsMOo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bhh4/bz6"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id A5BAF13801B3;
	Tue,  7 Jan 2025 10:13:33 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Tue, 07 Jan 2025 10:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1736262813;
	 x=1736349213; bh=VxBI9ebHOtj6/K9Cxb8gn245PG+CQQLYZN7REN0z6Fs=; b=
	ZLgfsMOo8nYg6wzbldxB/dhhlQGB3DXrpQ0Gz6n3lHxaI/tIC62DL5FBoqHAhMxx
	Z/I4XDJSOD7CgSTKgtDCRY4WsbN9vUna+bJTevFOHT7V+StmHX5hDA4XR3dknU0b
	InjDoHM2wboxtWMAkHREEAb7olVkvNT8AnBPLALS8ZWttSEXDZI1Tea0Qffs/BSt
	4frlj7EhKQwfVMMVSQ+xAmCqNUfkVC/aAurKqr48UuxHuvHXigHrT2MPayi1UWQG
	z8bMeERQRFyYf5tqN8SqXQv3SQVory+b3OEw+tasaxDsnEyeaQLepV5tfuq5ry3/
	PL0bXi59UEF0ai1G34HQIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736262813; x=
	1736349213; bh=VxBI9ebHOtj6/K9Cxb8gn245PG+CQQLYZN7REN0z6Fs=; b=b
	hh4/bz6H/7gCoM5F8ohUkVnSHXQ5XGn7q5YLLCAXRoi1iwLn+R4PnOuBw15zpkVT
	vSc5E6xspwLUWjTaemHrOkODPVuwcFCDAe2PETW1QaDxcXvPeNc3AX3IEbANgnNW
	oSpdwD3oFscO1oJZ4Tikb28mTIsgByVtSbFBV0h6ClcVSy2LJ3X3cirSbolggGld
	zf99Z7Cq0fWvQuKE9meUgU+lU99kFTsMdU+KlTDnus50MT2C9JCdololviTlABJ/
	K1UFy3tJrB8jC6BA6GBKWbYrizt9x/FSSADple4TCEzLFPLV5rCspCu3WbBlISKd
	bUHMSmBypYOyeE4h0vAfw==
X-ME-Sender: <xms:nUR9Z08FMpTI_6Mlk4hLQWhO8S9K6o81xO23lYRHRITsoT_0Q-czNg>
    <xme:nUR9Z8tY27jhx3jjXVjnhctlP-eA1NwLjy_0jVCZIfRdh_IckEel582lpff2_hyjR
    jjRO5ZRBNvkGsZAMXk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegvddgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnh
    hovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpedtffevgfethfevtedu
    vdefleevkedtuddvlefghefgieekffejteejveffkedthfenucffohhmrghinhepkhgvrh
    hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtg
    hpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhhithhjohhshhhi
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinh
    hugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrght
    rdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhg
    vghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:nUR9Z6CIr6Pbxa3fIbC_SdDPZY6oURBrkH8oHRLBRKYHeWZk5FuxWw>
    <xmx:nUR9Z0dY4F5fIzl0lnN4qmbD_ha8wvnVkn1MybLQ2NjQWeiw8ERPyQ>
    <xmx:nUR9Z5MkjSTpPFyh5i3H1Neh68kEEPNEIi7an-BYaUuQupATZ53oFA>
    <xmx:nUR9Z-lAXxHkYbYp_O3WY28I72X7FHc7-e92T1iORds2KND4rQLuxQ>
    <xmx:nUR9Z-qVna54BXiWUDS3tlwOHsVIvuixsLKqcptyECIVF6gGQ7bzMc5->
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 13C7A3C0066; Tue,  7 Jan 2025 10:13:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 07 Jan 2025 10:13:11 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Nitin Joshi" <nitjoshi@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <2aa6e80b-a130-4a30-b174-dc21f90c2348@app.fastmail.com>
In-Reply-To: <20250107021507.4786-1-nitjoshi@gmail.com>
References: <20250107021507.4786-1-nitjoshi@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: replace strcpy with strscpy
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Nitin,

On Mon, Jan 6, 2025, at 9:15 PM, Nitin Joshi wrote:
> strcpy() performs no bounds checking on the destination buffer. This
> could result in linear overflows beyond the end of the buffer, leading
> to all kinds of misbehaviors.[1]
>
> [1]: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy
>
> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c 
> b/drivers/platform/x86/thinkpad_acpi.c
> index 2cfb2ac3f465..c9e2dfb942ec 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -11681,7 +11681,7 @@ static int __init set_ibm_param(const char 
> *val, const struct kernel_param *kp)
>  		if (strcmp(ibm->name, kp->name) == 0 && ibm->write) {
>  			if (strlen(val) > sizeof(ibms_init[i].param) - 1)
>  				return -ENOSPC;
> -			strcpy(ibms_init[i].param, val);
> +			strscpy(ibms_init[i].param, val);
>  			return 0;
>  		}
>  	}
> -- 
> 2.43.0

Looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
