Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F9A3A0E88;
	Thu,  2 Jul 2026 18:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783016714; cv=none; b=mpQ2kQ+mQ38SEw79yf79I6BXuOmVnswEL+BbAPaNHHODM50aTp0ljordTFHI6olVtbAVGMLSpmODVpE+QbbtFwQK+Lc4ME2dU8/CLpEMEfofD24gH+iimdu++hopD+sV6vKRlJCd3VFnySyqYMmH3X51x1cTLIr/sYrzcIUMdyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783016714; c=relaxed/simple;
	bh=ZCURtYRwh0ZBSTDtQ8f6D2XMpp+bwjmWvswfz6AwyTE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GfHWycRpxRdxOprBAPHP5rog4FcsY8XIxBBYu0Zxs55YWyTX4BQ6UkSB1SUtNHQLqBiEF6wtfQlyiofBjQUgnNrw8+0wlzGXGE7t8BAZ4xJ0sY/eLcUEAe7es0poDv2j2hqdkafF24riSzwEN6ORBeZnicpQ4c5A/KR3n7JfkAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=SzzDtiAw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RlfBG4ih; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="SzzDtiAw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RlfBG4ih"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 480CB1400085;
	Thu,  2 Jul 2026 14:25:11 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Thu, 02 Jul 2026 14:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1783016711;
	 x=1783103111; bh=Q3Mj5yeqfYuFerqBhBwG2GVpxwE5dLLpQX2q9saIayo=; b=
	SzzDtiAwC0INlC9i3DL+LGUZJHpBrDIZQvqZLFsThFD9yZKwA93D327/38aZr1LY
	Fr2KAUYf2RW6IH5CaXOPR8btJXoQmvZK9asQJ3Jocx2AcmGlEZI06UssgEK6F61z
	g/tqyNPjypQlX/AUTCum140N2Xqgp303zuGHxEImZXB5NdY4lYRhRUwIcos6efS6
	Y1O+52hDwCMiSTeP0rsDH8qNJ8hFfa9L6qTnLrqYTJIKHSdHrhVO11m9haBLPDKS
	9MP7FtM9j/HKgb10cWwwPWmcEhPJ2KBlVL6LxEKwFvvTZTpbzttUtNt5NF3KD7yS
	8o+2gIh1lHhq8ScpnA3pTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783016711; x=
	1783103111; bh=Q3Mj5yeqfYuFerqBhBwG2GVpxwE5dLLpQX2q9saIayo=; b=R
	lfBG4ih8l8kbyaOX6tXj8MmGzb4CI0R4Kaqj5oPBxTgvjeEcg3NhG0rJgNj81Pde
	tXlzPnZaBCx8QrIpW9tlUUVlzn9tMkX7uh9/aJFur5x07dfqWauGuiPsiVE/7NrR
	ksqqBnF9smH5mOHlqm1MCSecPVT+3gCfJCjoTb98W2lbglOHyrZgDT8CIy7rR4d3
	es66emTBHwyDnX/gC+isB+DHU2/YgyhVra9IE5n4abrwMJOYs2iuH0NaYEHB708y
	/HFUQgw7VYkAxSHXIqFuCtiaSDCgdSlkeFQsYdyWHTbJca63+EiXlV+ZMsocf6qA
	reJUzCqwTVaGJvs2ZIERQ==
X-ME-Sender: <xms:Bq1GamP-i37sw5wFjNygVoTzgrc-g0t0MGx_pD5l4og9og7u3CRGUA>
    <xme:Bq1GavwV--CutItJZqaI3dyL5cGgjmCCQRM21t4xHB91azLLyV2WA8X_XOjq_SwUr
    Bf_dHXPe-l8fji9bx2fLzUj_JO_UTYUVtoqW1gUGbsYCfatXDdAPF9w>
X-ME-Proxy-Cause: dmFkZTF9CRAt9mHd/KIQtZraWvdoPnIbxbtxmtTPGJnPKEQkKMmLcVfpOweq4ip+WLPVCG
    SWMTgKrm51VXEMnL1p4A34R3B8EEcqFNTymOr+rLnnabHjg7GZxjaZjCWVuLwUdUUr4STy
    fC9tM1SaDne8HISRqNA6ki/3B12ynlcFcSNumhqhRKWTvTwKWdIFI3UqRyFDiAEgHjE85y
    s6cxOoS6fr1xDbY9Ei2P1bA1j2bk8lvQjepFXEGZEZvreXrIr9CFJFfFP0jwYGW1zUbP56
    KpIjk5F07jIrURtb2ki8bAl2mHOhxIz8MG9eC7NxEXGHxNnUwBIVKDhBPRsN+uskBUMMFC
    4CBenumV2BJhP0x91sglSq0hudVkJuMI6/YzBY0/mzv1LDpFlBaSigsSkvaRoFubw9Z4iU
    jQuII6xmz2GbzZ6BSonYwfX0w9gt1JDqUO67gl3xSiogk8Pd0rd21nN8lIx1HtTByVqvJQ
    6O9n6VZo0VV3LJJLvLG0JEqRWNbOjTSDJrY69aeALSBkQEoMkBInAxBN4vy2EArEuJSLIU
    5DsWa1zLYlfBVKapm+fCnXV+x2IdfAMD1sqcBgheJDLMUpYaCVkb7HLJAWUSFiFcth69Sg
    +/JtkU9IrjJxo9E1JwfTCt9mjQ9l0PWize82ACyjJggDAqHP/yFCFv3KJkEA
X-ME-Proxy: <xmx:Bq1GakeAjDXjBz3gx57NYALOuRF33o04gKMYUHkQ-V_Ox12ZDCXKTA>
    <xmx:Bq1GamoeKO3-UWGtx-cLwCZqaIULYgtI8N7J_L_JwjNj1W32RYtAyg>
    <xmx:Bq1GamMrJ8Q1ph3nis25X5CzkmCV_YwEkqX4lKMUy9V5CnHz90HiNA>
    <xmx:Bq1GahhSuAbnpDekjqROWLRkt0D9zWNkK4FTgDbLFNpQ5FnkgfcJcg>
    <xmx:B61GavSCZLZH-sb1ldhHwbJmGObEfOVsxCIcMcTiBcSc10DVbDdeFzoX>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4ECCE2CE0072; Thu,  2 Jul 2026 14:25:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AYxXUHs9rdZV
Date: Thu, 02 Jul 2026 14:24:49 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Anas Khan" <anxkhn28@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <5729870f-738c-42da-bf29-11e8e9f96dd0@app.fastmail.com>
In-Reply-To: <20260702101356.62694-1-anxkhn28@gmail.com>
References: <20260702101356.62694-1-anxkhn28@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: update stale thinkwiki.org URLs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Anas

On Thu, Jul 2, 2026, at 6:13 AM, Anas Khan wrote:
> The three thinkwiki.org references in thinkpad_acpi.c redirect to the
> canonical www.thinkwiki.org host. Update them to the current URLs.
>
> Signed-off-by: Anas Khan <anxkhn28@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 445e1403308e..c57f46cfbcbe 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -7826,7 +7826,7 @@ static struct ibm_struct volume_driver_data = {
>   *	does so, its initial value is meaningless (0x07).
>   *
>   *	For firmware bugs, refer to:
> - 
> *	https://thinkwiki.org/wiki/Embedded_Controller_Firmware#Firmware_Issues
> + 
> *	https://www.thinkwiki.org/wiki/Embedded_Controller_Firmware#Firmware_Issues
>   *
>   * 	----
>   *
> @@ -7851,7 +7851,7 @@ static struct ibm_struct volume_driver_data = {
>   *	mode.
>   *
>   *	For firmware bugs, refer to:
> - 
> *	https://thinkwiki.org/wiki/Embedded_Controller_Firmware#Firmware_Issues
> + 
> *	https://www.thinkwiki.org/wiki/Embedded_Controller_Firmware#Firmware_Issues
>   *
>   *	----
>   *
> @@ -11754,7 +11754,7 @@ static int __must_check __init 
> get_thinkpad_model_data(
>  	 * X32 or newer, all Z series;  Some models must have an
>  	 * up-to-date BIOS or they will not be detected.
>  	 *
> -	 * See https://thinkwiki.org/wiki/List_of_DMI_IDs
> +	 * See https://www.thinkwiki.org/wiki/List_of_DMI_IDs
>  	 */
>  	while ((dev = dmi_find_device(DMI_DEV_TYPE_OEM_STRING, NULL, dev))) {
>  		if (sscanf(dev->name,
> @@ -12289,8 +12289,8 @@ MODULE_DEVICE_TABLE(acpi, ibm_htk_device_ids);
>  /*
>   * DMI matching for module autoloading
>   *
> - * See https://thinkwiki.org/wiki/List_of_DMI_IDs
> - * See https://thinkwiki.org/wiki/BIOS_Upgrade_Downloads
> + * See https://www.thinkwiki.org/wiki/List_of_DMI_IDs
> + * See https://www.thinkwiki.org/wiki/BIOS_Upgrade_Downloads
>   *
>   * Only models listed in thinkwiki will be supported, so add yours
>   * if it is not there yet.
> -- 
> 2.54.0

I would rather remove these links completely. 
It's basically advertising for a non-Lenovo site that is not up to date with the latest information (the list of DMI IDs is ancient).

FWIW: 
 - FW issues should be posted on forums.lenovo.com/linux which we monitor
 - The DMI IDs should be retrieved from psref.lenovo.com
 - FW updates come from LVFS and not tracked on an out of date website :)

Afraid I'm going to nack this one.

Mark
