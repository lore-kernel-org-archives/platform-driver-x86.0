Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883404;
	b=H+lZiZV+TRBrgxPFcmoPrhd8ZSFehylCQte9U3BWkDIhn6op90fCcV2A1Ilh5Ce6OivD
	 k5KqY8WImOkbzuWga68dvMXlT+r1dRnNTw610gfHdhLyrgdkFwz2LGSqWvVa2WzIE/7wT
	 qSNq+Sp3nLTRMZe0B/iY2J170uNJ8lnFim/9UKuKthOhC7nqz8J7caLtKTLT/girXtcuo
	 dxF5+0/cgAz64HuCTs7cV2GlmdCOD0RmlgPqcP3ZRk2T20sEN6d4yfSw7eP8MbsP9OGjQ
	 cnI4bFKtj930HOHdY3cl1ZOsLCrX+t67VECFkg+/SRgDuwFBumELKdFwP473eIyaNqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883404;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CfPcvB++wsWrlfK0SuqJlUoXRuhQcrHaDaCEa5M/JBs=;
	b=1fRSFG07kyxfmLgYY5xv0AOQS0cmHxZL5rfLr9PrSyVFUjdHlrzHVB0VnSbVlJhnuSNA
	 zkDq0o8b62SYMB5wM3zi0cqwtOrWQoAloXtaD8En89UYFRhxKtiM8LDvG3Vat/xVGymxh
	 qoKIv4k0dTK1gueJ7XA/38yLZ36ks+erZlnMKbXrbFjzrRiWwwAcvQQKnnhgSHKLI29YU
	 b9psdtamXKxVM5UhBgfhQFedTXRMKRJlXb3G3KWF7B1l8lo2ydYcICd8McAEFeewPDoIX
	 yt8ZeGc3sFIglcbTOrbrTEyn+la3wlebfnu+Q4aN1jSc49VV7qI2cQqr2Rejupy5fjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qcNis7dC;
	arc=none smtp.remote-ip=91.218.175.131
Received: from mta0.migadu.com (out-131.mta0.migadu.com [91.218.175.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B005606A323
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 02:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B005606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qcNis7dC
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HoJ4ScLko7qTW7aeanrz78QLaJpCl7fO0b5x7Pn1u1s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794883401; v=1; x=1795488201;
 b=qcNis7dCHdgzJhHnQbx/4e+Vcyb22u/QNCiRh+EFL0rnoXd4UpmiqCZTBRz9EviWevOGKH+B
 kd3uZLp17i0o7tt9ywsCWIyLDewaXr4S2K+MlIew1R24dDTxlrCAYyH7/c6WeipAVvyXEZ5WKti
 +/aWKLyIxq/ujlL8ooW0eFek=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eebe6f70f4e10d27;
	Tue, 17 Nov 2026 02:43:20 +0000
X-Mizu-Trace-ID: eebe6f70f4e10d27
X-Migadu-Flow: FLOW_OUT
Message-ID: <d752f826-104a-4128-9f63-72e5eb8732d6@linux.dev>
Date: Tue, 17 Nov 2026 03:43:20 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] platform/x86: asus-wmi: Convert to
 pci_assign_unassigned_bus_resources()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116152403.2672-1-ilpo.jarvinen@linux.intel.com>
 <20261116152403.2672-8-ilpo.jarvinen@linux.intel.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261116152403.2672-8-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/16/26 16:23, Ilpo Järvinen wrote:
> The asus-wmi driver scans single device and then attempts to assign its
> resource using pci_bus_assign_resources(). That function makes bridge
> window sizing disjoint from the assignment phase and is going to be
> removed.
>
> Convert pci_bus_assign_resources() to
> pci_assign_unassigned_bus_resources() which is likely no-op in this case
> as it looks like bridges are not involved here.

Reviewed-by: Denis Benato <denis.benato@linux.dev>

> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index b33ebdb21aa2..9eb783eb53c6 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2325,7 +2325,7 @@ static void asus_rfkill_hotplug(struct asus_wmi *asus)
>  			}
>  			dev = pci_scan_single_device(bus, 0);
>  			if (dev) {
> -				pci_bus_assign_resources(bus);
> +				pci_assign_unassigned_bus_resources(bus);
>  				pci_bus_add_device(dev);
>  			}
>  		} else {
