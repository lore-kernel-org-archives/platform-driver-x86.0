From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v5 4/4] platform:x86: Add Intel Telemetry Debugfs
 interfaces
Date: Tue, 19 Jan 2016 23:00:46 -0800
Message-ID: <1453273246.22381.1.camel@perches.com>
References: <1453269897-14601-1-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453269897-14601-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2016-01-20 at 11:34 +0530, Souvik Kumar Chakravarty wrote:
> This implements debugfs interfaces for reading the telemetry
> samples from SSRAM and configuring firmware trace verbosity.
[]
> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -5698,6 +5698,7 @@ S:	Maintained
> =A0F:	drivers/platform/x86/intel_telemetry_core.c
> =A0F:	arch/x86/include/asm/intel_telemetry.h
> =A0F:	drivers/platform/x86/intel_telemetry_pltdrv.c
> +F:	drivers/platform/x86/intel_telemetry_debugfs.c

Maybe most of these should be deleted and
this should be a single entry:

=46:	drivers/platform/x86/intel_telemetry*
