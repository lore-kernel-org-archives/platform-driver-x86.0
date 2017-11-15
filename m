From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 0/1] Use checkpatch.pl to make thinkpad_acpi.c error free:
 octal permissions
Date: Tue, 14 Nov 2017 16:10:20 -0800
Message-ID: <420cba42-6bbd-1c4f-0fad-4e3292903bc4@infradead.org>
References: <1510701276.9469.19.camel@k3saltt0>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:38624 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752957AbdKOAKX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 19:10:23 -0500
In-Reply-To: <1510701276.9469.19.camel@k3saltt0>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Simranjit Singh <simranjit.singh@corebaby.org>, ibm-acpi@hmh.eng.br
Cc: dvhart@infradead.org, andy@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/14/2017 03:14 PM, Simranjit Singh wrote:
> From: Simranjit Singh <simranjit.singh@corebaby.org>
> 
> Using the checkpatch.pl script, there were 8 errors in thinkpad_acpi.c. I fixed them by changing permissions to octal,
> and by adding parenthesis. 
> On the current tree, if you use checkpatch.pl, thinkpad_acpi.c will have 8 errors. With my changes, there are 0 errors.
> However, I have added 3 new warnings. 
> I'm very new to kernel development, so if I messed up somewhere, please do tell me.
>     
> Changed binary permissions to octal in accordance with checkpatch.pl in thinkpad_acpi.c
> 
> Signed-off-by: Simranjit Singh <simranjit.singh@corebaby.org>

a. You should have [PATCH 1/2] and [PATCH 2/2].

b. Subject should be something like [PATCH 1/2] thinkpad_acpi: fix octal permissions
(if they need to be fixed)

> ---
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 2242d60..9ad1f5b 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9574,7 +9574,7 @@ static int __init set_ibm_param(const char *val, struct kernel_param *kp)
>  MODULE_PARM_DESC(experimental,
>  		 "Enables experimental features when non-zero");
>  
> -module_param_named(debug, dbg_level, uint, 0);

Is 0 not octal?

> +module_param_named(debug, dbg_level, uint, 0444;

missing closing ')'.  So you did not compile this, right?  boo.

>  MODULE_PARM_DESC(debug, "Sets debug level bit-mask");
>  
>  module_param(force_load, bool, 0444);
> @@ -9638,25 +9638,25 @@ static int __init set_ibm_param(const char *val, struct kernel_param *kp)
>  #ifdef CONFIG_THINKPAD_ACPI_DEBUGFACILITIES
>  module_param(dbg_wlswemul, uint, 0444);
>  MODULE_PARM_DESC(dbg_wlswemul, "Enables WLSW emulation");
> -module_param_named(wlsw_state, tpacpi_wlsw_emulstate, bool, 0);
> +module_param_named(wlsw_state, tpacpi_wlsw_emulstate, 044);

module_param_named() still takes 4 parameters.

>  MODULE_PARM_DESC(wlsw_state,
>  		 "Initial state of the emulated WLSW switch");
>  
>  module_param(dbg_bluetoothemul, uint, 0444);
>  MODULE_PARM_DESC(dbg_bluetoothemul, "Enables bluetooth switch emulation");
> -module_param_named(bluetooth_state, tpacpi_bluetooth_emulstate, bool, 0);
> +module_param_named(bluetooth_state, tpacpi_bluetooth_emulstate, 0444);
'
ditto.

>  MODULE_PARM_DESC(bluetooth_state,
>  		 "Initial state of the emulated bluetooth switch");
>  
>  module_param(dbg_wwanemul, uint, 0444);
>  MODULE_PARM_DESC(dbg_wwanemul, "Enables WWAN switch emulation");
> -module_param_named(wwan_state, tpacpi_wwan_emulstate, bool, 0);
> +module_param_named(wwan_state, tpacpi_wwan_emulstate, 0444);

ditto.

>  MODULE_PARM_DESC(wwan_state,
>  		 "Initial state of the emulated WWAN switch");
>  
>  module_param(dbg_uwbemul, uint, 0444);
>  MODULE_PARM_DESC(dbg_uwbemul, "Enables UWB switch emulation");
> -module_param_named(uwb_state, tpacpi_uwb_emulstate, bool, 0);
> +module_param_named(uwb_state, tpacpi_uwb_emulstate, 0444);

ditto.

>  MODULE_PARM_DESC(uwb_state,
>  		 "Initial state of the emulated UWB switch");
>  #endif
> 
> 
> 


-- 
~Randy
