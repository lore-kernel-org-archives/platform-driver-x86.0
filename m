From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: linux-next: Tree for Jun 17 (x86_pkg_temp_thermal.c)
Date: Mon, 17 Jun 2013 10:26:27 -0700
Message-ID: <51BF46C3.3090900@linux.intel.com>
References: <20130617185106.5950ffbf4b96acd9b2b2c834@canb.auug.org.au> <51BF4159.1000004@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:34114 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751216Ab3FQRUZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 17 Jun 2013 13:20:25 -0400
In-Reply-To: <51BF4159.1000004@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>

On 06/17/2013 10:03 AM, Randy Dunlap wrote:
> On 06/17/13 01:51, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20130607:
>>
>
> on i386 and x86_64:
>
> when built as loadable module:
>
> ERROR: "platform_thermal_package_rate_control" [drivers/thermal/x86_pkg_temp_thermal.ko] undefined!
> ERROR: "platform_thermal_package_notify" [drivers/thermal/x86_pkg_temp_thermal.ko] undefined!
>
> or when built-in:
>
> drivers/built-in.o: In function `pkg_temp_thermal_init':
> x86_pkg_temp_thermal.c:(.init.text+0x1492b): undefined reference to `platform_thermal_package_notify'
> x86_pkg_temp_thermal.c:(.init.text+0x14936): undefined reference to `platform_thermal_package_rate_control'
> x86_pkg_temp_thermal.c:(.init.text+0x150fe): undefined reference to `platform_thermal_package_notify'
> x86_pkg_temp_thermal.c:(.init.text+0x15109): undefined reference to `platform_thermal_package_rate_control'
> drivers/built-in.o: In function `pkg_temp_thermal_exit':
> x86_pkg_temp_thermal.c:(.exit.text+0x3a9b): undefined reference to `platform_thermal_package_notify'
> x86_pkg_temp_thermal.c:(.exit.text+0x3aa6): undefined reference to `platform_thermal_package_rate_control'
>
>
> Full randconfig file is attached (for loadable module build).
>
>
>

This requires CONFIG_X86_MCE, which is by default is set to "y".

Thanks,
Srinivas
