Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="FHj1mvx1"
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2755E3
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2023 12:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1702412349; bh=9XaxPYeyT70xat5k4Cly9n0+u1X7CcTCWb+RONcmc/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FHj1mvx1ZkN10Rjskh7YbDq/hjcff1reYNf+493XwhE8bSTJL2L0Zp5/brPFTkkGi
	 6UojLD69s2sESwP/PWENHPksEH6/knIj6HE67xTe/Z1ANDGzrKnb2F/MQAMIJhb2Ig
	 Uu19ciPfqM56Pm6rmmT0un8eEak3OGly3BV6Bf64=
Date: Tue, 12 Dec 2023 21:19:08 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	"open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Goswami Sanket <Sanket.Goswami@amd.com>
Subject: Re: [PATCH 0/4] Add a workaround for Framework 13 spurious IRQ1
Message-ID: <85397fdb-b093-4c03-8613-3815352f2b2c@t-8ch.de>
References: <20231212045006.97581-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212045006.97581-1-mario.limonciello@amd.com>

On 2023-12-11 22:50:02-0600, Mario Limonciello wrote:
> The 13" Framework laptop EC emits a spurious keyboard interrupt on every
> resume from hardware sleep.  When a user closes the lid on an already
> suspended system this causes the system to wake up.
> 
> This series adjusts the previous Cezanne quirk (which has a much different
> root cause) to be able to apply to other systems too. The Framework 13"
> system is added to the list it will apply to.
> 
> Mario Limonciello (4):
>   platform/x86/amd/pmc: Move platform defines to header
>   platform/x86/amd/pmc: Only run IRQ1 firmware version check on Cezanne
>   platform/x86/amd/pmc: Move keyboard wakeup disablement detection to
>     pmc-quirks
>   platform/x86/amd/pmc: Disable keyboard wakeup on AMD Framework 13
> 
>  drivers/platform/x86/amd/pmc/pmc-quirks.c | 20 ++++++++++++++
>  drivers/platform/x86/amd/pmc/pmc.c        | 33 +++++++++--------------
>  drivers/platform/x86/amd/pmc/pmc.h        | 12 +++++++++
>  3 files changed, 45 insertions(+), 20 deletions(-)

For the full series:

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Tested-by: Thomas Weißschuh <linux@weissschuh.net> # on AMD Framework 13

The device now only wakes up when opening the lid.

Thanks,
Thomas
