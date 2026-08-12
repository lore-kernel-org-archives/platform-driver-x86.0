Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1F1352018;
	Wed, 12 Aug 2026 19:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786561353; cv=none; b=KB5Zf2ESVQkGbWOLTt+cKnr+G8VkALpFTNJYYZb/7AGgXvibjpWqsEtK15OQYakMoFM58ExSFjVefnocLDUnKW56Qzgv8np8tKvmwFppKVOe0V67naJPtHYf1XMtuUhZBufjMdV+fxs2dOmHW39mVDF3ZAOJSosT9bPJqyV/2bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786561353; c=relaxed/simple;
	bh=15jGzcII7ieyvKsdvZ+sXFWy0DyTZ1cUTF94Q7NkSw4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=f1MDkSqlAaf2sZOC8CntW+PYsHSw7XhjQfLg8KaxSydULaUfZEH3jxrj2dbqOA5b3pRYzk5K428kplZUFtcQiIBLS/ec1oUiDuO/+VVVIIlDnNcLPMQoq4nGLIN+5LqaTjshKvFvN06xxdmR8ioj2wXvikbX0QjKs9PVTDZmXLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=NFfqUrx4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LQqrINEV; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="NFfqUrx4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LQqrINEV"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 42E3D1400041;
	Wed, 12 Aug 2026 15:02:31 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Wed, 12 Aug 2026 15:02:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786561351;
	 x=1786647751; bh=tda3eWnoIi4/U4mjkMMYsdaLbRUWU7gnCMPW5WOu7OA=; b=
	NFfqUrx4T37bcbadhuDbL6rWVfAdk5zLbGmHUEU6aT/eOTGlpmakcO4Nm6eUyT8b
	aOdbC2nN1f/+r13/S5o32GU275NcChPVZM+IXI6YxC1JdGb+4XNWKwJz1V4zpHz+
	S/auMS32Kxa5zWYWnZizZ4I/+troBGhYdDtFDABIDYCSiOlcPvmOW1EM1FhzhLYg
	4MkETtNI9/cmvwSnRc2/7R6eTWqT581WVM65pfR8bdkUtfGV2it8Wj8OkSBRIBPd
	t7gHcBf9fRHFeItoTa1bdQm5FYgoBwe16MypWku5UW9KQJ6MhG5rg6EtRRofDUiL
	tv1UpzIEl17eYOGGwsVDig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786561351; x=
	1786647751; bh=tda3eWnoIi4/U4mjkMMYsdaLbRUWU7gnCMPW5WOu7OA=; b=L
	QqrINEVD6dzOTAMJsWiJrvZ0M9XiwKmDXcWGq/7zCc0k8TyAZQFEbbYIlBGgOFTS
	gUzTO01qhF7iyc7hQdHOniEoqllMyXU5upcSZu7OieBopHMZK6SjOq5MH/2Qu4ee
	pT4IXE/JjDmlgTQawJkaGdIrUCTfwdmQq9ysb4PjLD7ZzlvfrNwp+i+9hKxXg3Qr
	gpfO07pNtXOChyg39Qo/mtO5OkMAO6L5OaLZHvpuK8VCjaGE3FgIqujy1iceGB8Z
	hpdz7xgQMcxCoW4snYPRNuwTPuveLgD+AXK5onmEAAiGv7zvoEORjvY5v5q3ZJVd
	mn0G55MIATFgzKMdRCGqA==
X-ME-Sender: <xms:R8N8as-jq4fz0COuq1bxxB24-7McjrPelTp1zfLYjzUEgatryeFwJQ>
    <xme:R8N8aviMo1lHdcIa6s8C7wVA8r-Gsv_EXhi4LSPn1XZL9QmN94yJVhCgJzsnOp9l0
    qEaQtUrBTpwALafalMdbRaBQg_5HcC4P9uTrlUSv3NL_vIVRuiF7lmV>
X-ME-Proxy-Cause: dmFkZTELIe8Hx7hxGiX6S84DAZg1qcHZANJ5UKFO8qaGRBJND3s2+D6Fh9fmdLDOKWnEaT
    6pFEj00neJlaWTi0Bi+utr6ydMTDhfl9Zq/vtxsVOU+6KJbImVwBAALzujcuUG5lgar5Na
    /9G/8wCCYIUS97fOh+w7b7eZP5bNHhtDseAtgFmykMMjSXBmOBEOhAF52vEguP7DKpfP0s
    5OA61AqQ/9eDhoBbc0Lr2XQSJWPQfo0Tu/eQU1acXZhguJP/JCbX3daeFGkrzpu9thwSrK
    V7bD48KaXHNHAjmiUvZefm+ZBuVltimM3hxq1zwZmBxv35e0ZNWKY42qIsHbC0P0Yk6Vsi
    lUQ7SDwwbDrSm9jUf6gL/Pi36CFST57v1I6DoOk6/OS0JT0QLMZ4eGoKeRVJK7WuSLFrFD
    mOctvIqI6NIkSloSnIxSCOu7KPuDmvj+efpGueJgWs3e4K2m17CwnwsfrrETtFnh+MOsec
    OXkVVPCjEq2setkEpLDDEBANzJUMJJ5dPBEaqFmk+lHHWYskwKfqBW+TcePpIEGZ92M4Ul
    w61cqQxfwzSodAGXcUKe6ObQbw1phf4debvjPxQkXCtc7NprN6Jt8U39weJPNmAqX7y7r0
    ZpvKNKKoDLBB0CL/GQyw7eW0iRSzIRG+QdjexydgsB5RP0sxaRgbHFgUC8BA
X-ME-Proxy: <xmx:R8N8akI8RRo_tjo00bp28BcxFBtICh5PTv15pPyzMGgU4XqMVsoldQ>
    <xmx:R8N8aqJreAU02jL0Qe9jQ3LOo5yweFxCuNDZbW1ATCzKKDm-1fAqxg>
    <xmx:R8N8avjIEc7sqrZzJEgdg6BWQN55mAvEqhIa59wSioGGcUxd1Cq7IA>
    <xmx:R8N8akNyM88034M6381quMVDx2sE0erhM_wFeFk_CtZyT4YTSouk-Q>
    <xmx:R8N8apkm34-WvZTpdJK75RrzTQqbqF4pbODWsNnxwj9J3Oh5j0yqt8vB>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F18862CE0072; Wed, 12 Aug 2026 15:02:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AmYn76nK11f-
Date: Wed, 12 Aug 2026 15:02:10 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Nitin Joshi" <nitjoshi@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <d20cb764-a9ea-4443-93d4-486d7310dd4f@app.fastmail.com>
In-Reply-To: <20260806061925.625482-3-dmitry.torokhov@gmail.com>
References: <20260806061925.625482-1-dmitry.torokhov@gmail.com>
 <20260806061925.625482-3-dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 3/3] platform/x86: thinkpad_acpi: use __free(kfree) for automatic
 cleanup
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Dmitry,

On Thu, Aug 6, 2026, at 2:19 AM, Dmitry Torokhov wrote:
> Use __free(kfree) for local pointer allocations in dispatch_proc_write(),
> tpacpi_brightness_get_ecnvram(), and auxmac_init().
>
> This ensures automatic memory cleanup when exiting function scope and
> removes explicit kfree() calls on exit paths.
>
> Assisted-by: Antigravity:gemini-3.6-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 40 +++++++--------------
>  1 file changed, 13 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 0d0d6fe7eecd..200e20f90a4b 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -885,7 +885,6 @@ static ssize_t dispatch_proc_write(struct file 
> *file,
>  			size_t count, loff_t *pos)
>  {
>  	struct ibm_struct *ibm = pde_data(file_inode(file));
> -	char *kernbuf;
>  	int ret;
> 
>  	if (!ibm || !ibm->write)
> @@ -893,16 +892,15 @@ static ssize_t dispatch_proc_write(struct file *file,
>  	if (count > PAGE_SIZE - 1)
>  		return -EINVAL;
> 
> -	kernbuf = memdup_user_nul(userbuf, count);
> +	char *kernbuf __free(kfree) = memdup_user_nul(userbuf, count);
>  	if (IS_ERR(kernbuf))
>  		return PTR_ERR(kernbuf);
> -	ret = ibm->write(kernbuf);
> -	if (ret == 0)
> -		ret = count;
> 
> -	kfree(kernbuf);
> +	ret = ibm->write(kernbuf);
> +	if (ret)
> +		return ret;
> 
> -	return ret;
> +	return count;
>  }
> 
>  static const struct proc_ops dispatch_proc_ops = {
> @@ -6628,26 +6626,21 @@ static const struct backlight_ops ibm_backlight_data = {
>  static int __init tpacpi_evaluate_bcl(struct acpi_device *adev, void *not_used)
>  {
>  	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> -	union acpi_object *obj;
>  	acpi_status status;
> -	int rc;
> 
>  	status = acpi_evaluate_object(adev->handle, "_BCL", NULL, &buffer);
>  	if (ACPI_FAILURE(status))
>  		return 0;
> 
> -	obj = buffer.pointer;
> +	union acpi_object *obj __free(kfree) = buffer.pointer;
>  	if (!obj || obj->type != ACPI_TYPE_PACKAGE) {
>  		acpi_handle_info(adev->handle,
>  				 "Unknown _BCL data, please report this to %s\n",
>  				 TPACPI_MAIL);
> -		rc = 0;
> -	} else {
> -		rc = obj->package.count;
> +		return 0;
>  	}
> -	kfree(obj);
> 
> -	return rc;
> +	return obj->package.count;
>  }
> 
>  /*
> @@ -10989,24 +10982,23 @@ static int auxmac_init(struct ibm_init_struct *iibm)
>  {
>  	acpi_status status;
>  	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> -	union acpi_object *obj;
> 
> -	status = acpi_evaluate_object(NULL, "\\MACA", NULL, &buffer);
> +	strscpy(auxmac, "unavailable", sizeof(auxmac));
> 
> +	status = acpi_evaluate_object(NULL, "\\MACA", NULL, &buffer);
>  	if (ACPI_FAILURE(status))
>  		return -ENODEV;
> 
> -	obj = buffer.pointer;
> -
> +	union acpi_object *obj __free(kfree) = buffer.pointer;
>  	if (obj->type != ACPI_TYPE_STRING || obj->string.length != AUXMAC_STRLEN) {
>  		pr_info("Invalid buffer for MAC address pass-through.\n");
> -		goto auxmacinvalid;
> +		return 0;
>  	}
> 
>  	if (obj->string.pointer[AUXMAC_BEGIN_MARKER] != '#' ||
>  	    obj->string.pointer[AUXMAC_END_MARKER] != '#') {
>  		pr_info("Invalid header for MAC address pass-through.\n");
> -		goto auxmacinvalid;
> +		return 0;
>  	}
> 
>  	if (strncmp(obj->string.pointer + AUXMAC_START, "XXXXXXXXXXXX", 
> AUXMAC_LEN) != 0)
> @@ -11014,13 +11006,7 @@ static int auxmac_init(struct ibm_init_struct 
> *iibm)
>  	else
>  		strscpy(auxmac, "disabled", sizeof(auxmac));
> 
> -free:
> -	kfree(obj);
>  	return 0;
> -
> -auxmacinvalid:
> -	strscpy(auxmac, "unavailable", sizeof(auxmac));
> -	goto free;
>  }
> 
>  static struct ibm_struct auxmac_data = {
> -- 
> 2.55.0.679.g6767b8d81c-goog

Another kernel implementation I didn't know about.
It all looks good to me, and gives some nice clean-up. Thanks

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
