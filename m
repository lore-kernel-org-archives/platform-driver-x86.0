Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0A5360757;
	Tue, 10 Feb 2026 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770721052; cv=none; b=uJl+rSqbUYyz32r7qIlepVfC6/JSzI5Ow7XrRhpaD32DYliw4BwQV6dxKEvRJbT/D2Y2u0b+tWPIpP83U/20iuh67X/N+1EtEwa4Hdl5xSamZESbN6NWt/j66K+yVJHaUZyOSOfqQA7h2sYY0N83EVHVJ26X4BXnMMCpjvbiRRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770721052; c=relaxed/simple;
	bh=PtIzpvWPflXYNBHCxnnAjeNbs2IoZ0qxFQvxqUeVjbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MCNcfiS3YY1mKUUuTpV4LCXMoqrJYyiFBjm6QsWH1PXpGfsDhZe7hj1ubXervlRUxGTYwiS8KBiiPx+kl+NQZTarElypHWnlo+OXFGMjVKkDqBYlOjZoZt71QYlSDLS0+X/M0qf82a6F5QkOiN2LNC28sZse0dtTqmulKm3ZOGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AsPcw9CU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AsPcw9CU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7326EC116C6;
	Tue, 10 Feb 2026 10:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770721052;
	bh=PtIzpvWPflXYNBHCxnnAjeNbs2IoZ0qxFQvxqUeVjbo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AsPcw9CU0/OEdd4uve22CRzQ5Zhe0rEMuNHPAaTQeiaUFVge1zZP/cULgbVvYUL0+
	 ab4C/CCiQY5iXUluldgCjEneafi7+p4gqQfv8zI8PUWDWWj1lpauKn/tx1Bny3HzvK
	 OLFdCYlDwPs5rSR7qwKQ5n6LJh/8XWowQXYiE5pAgXoms1XAsa05Y5huUYO0yM7BX3
	 rzUkTu5WaVeBIdtRokWNoDmDMrXqdlg4Qjnb71Pm6/zCNSlZGRf5pq7iRRBMNFLLhp
	 nx6U/iVGWFBxiFIo+4gxDgcxxIip+GIsZlG+DvRJDZIqLac/kwW41G08z9ha7mB3uG
	 wZs/94aevHckQ==
Message-ID: <836660e9-02d4-4890-a422-9bea72168a62@kernel.org>
Date: Tue, 10 Feb 2026 11:57:29 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: intel-hid: Enable 5-button array on
 ThinkPad X1 Fold 16 Gen 1
To: Leif Skunberg <diamondback@cohunt.app>, alexhung@gmail.com
Cc: ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260210085625.34380-1-diamondback@cohunt.app>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260210085625.34380-1-diamondback@cohunt.app>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10-Feb-26 09:56, Leif Skunberg wrote:
> The Lenovo ThinkPad X1 Fold 16 Gen 1 has physical volume up/down
> buttons that are handled through the intel-hid 5-button array
> interface. The firmware does not advertise 5-button array support via
> HEBC, so the driver relies on a DMI allowlist to enable it.
> 
> Add the ThinkPad X1 Fold 16 Gen 1 to the button_array_table so the
> volume buttons work out of the box.
> 
> Signed-off-by: Leif Skunberg <diamondback@cohunt.app>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/platform/x86/intel/hid.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 560cc0631..6f059740f 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -135,6 +135,13 @@ static const struct dmi_system_id button_array_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkPad X1 Tablet Gen 2"),
>  		},
>  	},
> +	{
> +		.ident = "Lenovo ThinkPad X1 Fold 16 Gen 1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkPad X1 Fold 16 Gen 1"),
> +		},
> +	},
>  	{
>  		.ident = "Microsoft Surface Go 3",
>  		.matches = {

