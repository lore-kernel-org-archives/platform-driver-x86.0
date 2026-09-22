Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FECF542809;
	Tue, 22 Sep 2026 17:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098464; cv=none; b=FpvOmujGZtad8B/tSohK5fWck85iNNiIrV58bn9i1CYxdBIWbYa46lXfia0anysVzIhUr8y/Eh5P6Tx1atWpSlOa0eQ9tMXaNGnVfp045AdNL/uaD+u+5RPa5gntxgnQ2RB3G1/wE0cc/X2xUuX8z0ipQbqp1kh9xxBI7VzRtyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098464; c=relaxed/simple;
	bh=ukOlo2vGn70JZGzVXuAlIims2pQQYT4vQSxywCxDG8U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pog5l7ZFo+/j3+G+79gpojKUlB/g67eGa+wZSIM4D2NnpCWZ/EE4WV3KyTjPurS/l2vwvKqBt02qeaPlig2W1VW6oPUODGaKMp+hZeSdG+7ljUHiEX461baImPJh03jVMZubAlJUQ+wQHMiJ9iswHIkTkocHC1wQ+LY3Sq5Iy8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=ARwrrRmD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IksjCLAt; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="ARwrrRmD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IksjCLAt"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 4CBF41D00059;
	Tue, 22 Sep 2026 13:34:22 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Tue, 22 Sep 2026 13:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790098462;
	 x=1790184862; bh=6H+YOl8Fnzz4K8Crd5BxWR2DINMXVIbj7Hdfe8EQZVQ=; b=
	ARwrrRmDWYo22FyFQoqWMKb2DR7NOIXzk68yICmK1Bu5DWO/Thyn4sGtold+anM5
	w873j3V8dv3UbYlFcdPpKGkW8CSN/tCF75QCjrz3aOx4r4WS9gOpDRuT1Kvskr3A
	dvprqft26aRZed+Xj/8tkbGtdRNs0KqKNkleKADmVjz/mOIOupMaCV72SDYzmQtE
	ZIKHUPmzr0LWMlgx83VtR6zECz8120+gi2WxkiR9Zfgs4eH5xG7fSFP2dO75HjXt
	btqimURc4cv6wsNA1tEhEL09iInmdEa8x9tKN+ZBHe6cPdvgyz4V2jvZUGHk42yY
	nqRlrcPGGu+PIEtuDomkyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790098462; x=
	1790184862; bh=6H+YOl8Fnzz4K8Crd5BxWR2DINMXVIbj7Hdfe8EQZVQ=; b=I
	ksjCLAtNXZMGIRREfpiLfeTJ3r91iIa+4HcWBG+NYXuZF22XL9Q4QkZmcmNWhC5h
	Xb/k37p5dtfCc6/h65nlzP4WbdARxb/JNoz8Oce0MwSyXYsLK1ugXKmvHsc3jU7b
	kF5t4js4yFrVOutH5oNZ+sWY/5yp45+CJzVP2zRM+W/lBk2Ws7BHcRXzdBUARxnX
	VjLLJoxyWKHhedjkWqGXmLkR5Hyxm2/IXzaCJ1v1mk4AawuGZG2T3UFbbBpW2PVs
	/yeMesVJxm/vGzDQVc1D4l0o1+N6QfohpqyeF28SbvT8wteBmYEfV9g250rgx8cs
	PxmZwgZ6TckIX1LVa+jJg==
X-ME-Sender: <xms:Hbyyas1MnFIGL5BpeINzlyFx5OLoj6JJIoAZ7EUzICKraYpi30Ihyw>
    <xme:Hbyyah61Fwjnm04ARQzxCsiYHtk9SRJ63icY2PA06_j3EKtiP0WhSlJI8Hsju9GPR
    l4eRmOv4cc4f6ce4y3r6huZIyL85Bkw8OmNZXIuPF0G0-haQsUkVv3H>
X-ME-Proxy-Cause: dmFkZTEKb6HwOS5fnRhC/tIqkipbGOGo8cVH75WGEbYuvw5epbQL2V6pXm/VuHu3ARepVc
    8GgsZ6aAE8FWQHjYhp5WRAN5GA5YmbYDqdz6jtAL1VpfOVaZEpWP+ivGpNdhPhJLS9j9Ez
    Kc2bRiyzy6obI4jzdPlD19sFKjjB7ZMJuXX4G7o8KOZGn7Y+A1WosuTbA0rjouckT6lmmB
    adRc5P9vmL8F+COUuXXQ0UvwF9nYWnr9DUGO4uVxeMrqpLUfW7FeZPS1kD3Lxr5zNYv9hJ
    81qXbUWi/gAjE3LITr9cTGRrP8UH6MrfpFQR0TPOTN1BCF5yBew194o+TyxL5VLhfG22rN
    ZSMvg5sNZYQlBQMElgvZHVJshoK/IHEQnwpWF3wdY5cLQJbVRuX+9+kQScKWlKc0RCdP0c
    3TwQE6UEte0tTzJnzKtiLZF69yy1YVD1+eBUcb695B5AKSZ0kewXZzcngHkTXV72bpGOur
    0tK5HmcCPazOxf6iDX975R0XMLzCSM8lSXbSOJw8BBGIObH9R7wpq1lrcGtN58oc7n4ayk
    kfI805elGPRnCJzgnVf077lkk+x3vAkN68m0+WWQfjNdUFP4FnVG3T7UENswfoJFiWRfB9
    ciIcXqlftNG3TX9dJwc1FQ7m99l2TpcqH2P5L8UOdmQ0QgQ8vAHFZAfsgEYQ
X-ME-Proxy: <xmx:HryyakZ2xy810YGKZrAjNyFtzHTN_qXpzXwRhzFHNFDa478q8DvSqA>
    <xmx:HryyahpEhkenYrB02phq-KBApx15ympNg_G159yImv-FLv_zOYuf0g>
    <xmx:HryyahM3llSA1gFd2bzltrv88CxsI-MurweY2O3SLbS-5g7Rwnbc0g>
    <xmx:Hryyakrzo8f0YcpyBIeHu-Hg_QqVpyWpFk4hFoLl6g-lAWK5Wsz1Tw>
    <xmx:Hryyagn8O9M_wDYu49DXMaDDkpBJT_qVcck3yqzMFJiVMn34Y3R0fuAj>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id D7F532C00067; Tue, 22 Sep 2026 13:34:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AB7I15pHxv-c
Date: Tue, 22 Sep 2026 13:34:01 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Thorsten Blum" <blum@kernel.org>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <50a98ed4-9695-415b-885a-e3127fdf7fd4@app.fastmail.com>
In-Reply-To: <20260920103518.281843-2-blum@kernel.org>
References: <20260920103518.281843-2-blum@kernel.org>
Subject: Re: [PATCH] platform/x86: think-lmi: Use sysfs_emit() in pending_reboot_show()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Sep 20, 2026, at 6:35 AM, Thorsten Blum wrote:
> Replace sprintf() with sysfs_emit() in pending_reboot_show().
> sysfs_emit() is preferred for formatting sysfs output because it
> provides safer bounds checking.
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/platform/x86/lenovo/think-lmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/lenovo/think-lmi.c 
> b/drivers/platform/x86/lenovo/think-lmi.c
> index 3ddc1f5cec19..7b319601662a 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.c
> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> @@ -1281,7 +1281,7 @@ static const struct kobj_type 
> tlmi_pwd_setting_ktype = {
>  static ssize_t pending_reboot_show(struct kobject *kobj, struct 
> kobj_attribute *attr,
>  				   char *buf)
>  {
> -	return sprintf(buf, "%d\n", tlmi_priv.pending_changes);
> +	return sysfs_emit(buf, "%d\n", tlmi_priv.pending_changes);
>  }
> 
>  static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
