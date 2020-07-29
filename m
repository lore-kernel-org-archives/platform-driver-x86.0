From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] platform/x86:dell-laptop:Add battery charging thresholds
 and charging mode switch.
Date: Wed, 29 Jul 2020 08:27:56 +0100
Message-ID: <20200729072756.46skroedpbo3fjyn@srcf.ucam.org>
References: <20200729065424.12851-1-Perry_Yuan@Dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200729065424.12851-1-Perry_Yuan@Dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Perry Yuan <Perry.Yuan@dell.com>
Cc: sre@kernel.org, pali@kernel.org, dvhart@infradead.org, andy@infradead.org, mario.limonciello@dell.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jul 28, 2020 at 11:54:24PM -0700, Perry Yuan wrote:

This seems extremely useful, but:

> diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
> index bf3b48f022dc..a8adc3b0ca4b 100644
> --- a/Documentation/ABI/testing/sysfs-class-power
> +++ b/Documentation/ABI/testing/sysfs-class-power
> @@ -334,6 +334,29 @@ Description:
>  		Access: Read
>  		Valid values: Represented in microvolts
>  
> +What:		/sys/class/power_supply/<supply_name>/charge_control_charging_mode
> +Date:		March 2020
> +Contact:	linux-pm@vger.kernel.org

The values here seem very Dell specific, but this is going into a 
generic sysfs path. Really stuff here should be as vendor independent as 
possible. If these values don't correspond to a wider industry 
specification it probably makes sense to make this something Dell 
specific.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
