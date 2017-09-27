From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] Asus WMI : Add lightbar led support
Date: Wed, 27 Sep 2017 00:28:21 -0700
Message-ID: <20170927072821.GA19973@fury>
References: <20170923162337.2748-1-maxime.bellenge@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:55154 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751383AbdI0H2X (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 03:28:23 -0400
Content-Disposition: inline
In-Reply-To: <20170923162337.2748-1-maxime.bellenge@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxime =?iso-8859-1?Q?Belleng=E9?= <maxime.bellenge@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Sep 23, 2017 at 06:23:37PM +0200, Maxime Bellengé wrote:

Hi Maxime,

Thanks for the update. The patch has been applied and is queued for
testing.

In the future, please take note of the following comments - which I have
addressed in the patch.

The commit subject format:

platform/x86: <driver>: Subject

Whenever submitting to the Linux kernel, please take note of the format
used in previous (especially recent) commits to the same and adjacent files.

> Some asus laptops (ROG series for example) are provided
> with a lightbar behind the monitor.
> This patch make possible to switch it on and off.
> This lightbar works exactly as any other led.

Wrap at 72 characters or so in paragraph form.

> 
> V2 : fix whitespaces and typo

Patch revision history goes below the --- line below (see the submitting
patches documentation for details). This ensures it is automatically
dropped during the patch application process and avoids the requirement
for manual edits by the maintainers.

> 
> Signed-off-by: Maxime Bellengé <maxime.bellenge@gmail.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 63 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
...
> +static void lightbar_led_update(struct work_struct *work)
> +{
> +	int ctrl_param;
> +	struct asus_wmi *asus;

Declare variables in descending order of line length.

-- 
Darren Hart
VMware Open Source Technology Center
