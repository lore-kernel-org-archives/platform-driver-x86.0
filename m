Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA593D76;
	Sat, 20 Jun 2026 00:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781914078; cv=none; b=bifdUjsJQpzzdrdphuIMS03AbI8lnIFwEWEQ/58zapOZdhyrlfxai/YUeZ/duR+gQGk8VXpWEjfIsnF8S2CWNCryT5HUwnW6oLCXxPSTjOxcoLAXfXadtBPQhcVY8HqSNFxhvArRDwW8Sf5Y93UJfaHIz7qOTSnHiw3ufmcoxFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781914078; c=relaxed/simple;
	bh=YT6lSmhcxzkwV/jnIIAMmrb6JUVNzTs+j0O+EQs7ka8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ABxp5D1QHRef5RoLwu62mwQ/Epbv7oW//dLUCAXNRcFeQn+nYaiYqduL1gO21MPs55+Mx753CN77uDBUa5awnCnmYDL6Te2tDp1PrUbvKg0/i8CVwMf+wni6DN8dGZqwWZOxhh6MesFfeWFGPklb0ApUv9EGppeJISZuDqyIPEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=XENRIcYz; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="XENRIcYz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781914062; x=1782518862; i=w_armin@gmx.de;
	bh=x/fAy0ngEx63I+W/9yDMtO6ZDCGzfNV/VHvu0xM0kxE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XENRIcYziyATd5mkOmi6HcUK95K02YDy117r+AJjjPzT6y4KnkZDFFo5kTewmK4r
	 cz+NnNe9H/4wK3sg07yVvwI9ch70gEoHHZqvTV4Xr8jfagcGXjnAwM+2bm+iBOkn6
	 m3fMTRdy80JQ2yeFFrg4hnZ9JRq88j+kgp2Hgg1wfWDVrpqzDSSMTsEgr2P/25LDQ
	 Z0g2F80V2cA2txTn8EIqxqzMXHHJkIJ5Msm1qgiLviiRNuWc7MJKbOwD60RgrbBSL
	 ahsXbto/YFQ99JW6AlGCMdTZ1BPAyUIuxpjPo4yCpwSNMch00dRLeITM6AVwzunuB
	 lgYE9IwcmQCWaQGpXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIdif-1wMAvr2rtV-006XiY; Sat, 20
 Jun 2026 02:07:42 +0200
Message-ID: <b9b95a39-e1d3-451e-80f6-4df49605eeb3@gmx.de>
Date: Sat, 20 Jun 2026 02:07:41 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] platform/x86: msi-wmi: Fix unknown wmi event
 messages on MSI Claw models
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 Thomas Renninger <trenn@suse.de>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260613021654.933618-1-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260613021654.933618-1-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:T4QNrWNdyPlIJoa05E/Jofoi7DDM58ilKIs9tJmT531N51+CEgf
 XERNledpg9E58w3lRAuWVW6hwLmPB6y4GIweKKGpqDUKP1v1I/J3cKPloEjhmRlpdJC5qX+
 kWCnmbcZBHKx0EDJ5SYn6yCzYFUI1AoCrFn1L6bZkCZeMVL8n6GWfNzpJoKkBTYiHu7sggn
 PGiC0Ij+JMViQh2YbC+AQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7DPsVBVaGxk=;Zg2BQ3+hQTWjSKUjoVtDvDmycpE
 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
 uUvggtDFfXtLp2EDT8=

Am 13.06.26 um 04:16 schrieb Derek J. Clark:

> MSI Claw devices produce WMI events through the MSI WMI hotkeys GUID for
> some of their buttons. When pressed, these cause spam in the kernel. The
> Claws use a GUID already supported by msi-wmi, but use an
> ACPI_TYPE_BUFFER instead of an ACPI_TYPE_INTEGER.
>
> Patch 1 reformats msi_wmi_notify() to reduce nesting by using early
> returns and a switch case in preparation for handling this new data
> type.
>
> Patch 2 adds known MSI Claw event keycodes to the keymap and support for
> ACPI_TYPE_BUFFER.

For the whole series:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v2:
>    - Add comments explaining buffer fields & length.
>    - Test that we have at lease u8[2] before assignment of key ID
> v1: https://lore.kernel.org/platform-driver-x86/20260611223920.1679438-1-derekjohn.clark@gmail.com/
> Derek J. Clark (2):
>    platform/x86: msi-wmi: Reformat msi_wmi_notify()
>    platform/x86: msi-wmi: Add MSI Claw M-Center keys
>
>   drivers/platform/x86/msi-wmi.c | 97 +++++++++++++++++++++++-----------
>   1 file changed, 65 insertions(+), 32 deletions(-)
>
