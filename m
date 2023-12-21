Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9B7627E2
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Dec 2023 17:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="P57+KVzM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1703179641; bh=5RSa63EUfW6naxj841z8oVFrrmPfKOZO7u+cCiwtH94=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=P57+KVzMn76nHG9lwIKdR8pzNDDLQcHAHD8+XpB3ZTxfEhvFhib2NF/AalkeQpwSD
	 zwp52vCsSDnQGzYqTrBJuUSAa2kzlBhuWKiuPoW98n9vynCVW79SyOJnfDcaaamu82
	 1pa0jpmT/yrmfngTwwds1Z8P4KDB62QQhz9t87VU=
Date: Thu, 21 Dec 2023 18:27:10 +0100 (GMT+01:00)
From: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh_?= <thomas@t-8ch.de>
To: Suma Hegde <suma.hegde@amd.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com, Naveen Krishna Chatradhi <nchatrad@amd.com>
Message-ID: <14b02288-a14b-4e06-acf2-f2145df565a6@t-8ch.de>
In-Reply-To: <20231221172114.1569559-1-suma.hegde@amd.com>
References: <20231221172114.1569559-1-suma.hegde@amd.com>
Subject: Re: [PATCH v3 1/7] platform/x86: Move hsmp_test to probe
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <14b02288-a14b-4e06-acf2-f2145df565a6@t-8ch.de>

Hi,

The subjects of all patches in the series are
very generic.
They should have some more specific prefix IMO.

Dec 21, 2023 18:21:48 Suma Hegde <suma.hegde@amd.com>:

> This is in advance to supporting ACPI based probe.
>
> In case of non-ACPI driver, hsmp_test() can be
> performed either in plat init() or in probe().
>
> however, in case of ACPI probing, hsmp_test() cannot
> be called in init(), as the mailbox reg offsets and
> base addresses are read from ACPI table in the probe().
>
> Hence, move hsmp_test() to probe as preparation for
> ACPI support.
>
> Also use hsmp_send_message() directly in hsmp_test()
> as the semaphore is already initialized in probe.
>
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
> Changes since v1:
> 1. Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"
> Changes since v2:
> 1. Add "Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>"
>
> drivers/platform/x86/amd/hsmp.c | 30 +++++++++++-------------------
> 1 file changed, 11 insertions(+), 19 deletions(-)
