From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH v4 0/3] platform/x86: dell-wmi: new keys
Date: Fri, 12 Jun 2020 16:09:49 +0200
Message-ID: <20200612140949.523opfqkxfv3x5cx@pali>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <cover.1591811549.git.y.linux@paritcher.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1591811549.git.y.linux@paritcher.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Y Paritcher <y.linux@paritcher.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Mario.Limonciello@dell.com
List-Id: platform-driver-x86.vger.kernel.org

On Wednesday 10 June 2020 13:56:55 Y Paritcher wrote:
> change since v3:
>     No code changes.
>     Update commit message to reflect info given by Mario at dell.
>     
> Is there anything more i have to do for the patches that were reviewed
> or will they be picked up by the maintainers?
> Thanks
> 
> Y Paritcher (3):
>   platform/x86: dell-wmi: add new backlight events
>   platform/x86: dell-wmi: add new keymap type 0x0012
>   platform/x86: dell-wmi: add new dmi mapping for keycode 0xffff
> 
>  drivers/platform/x86/dell-wmi.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> -- 
> 2.27.0
> 

I'm fine with this patch series too.

Reviewed-by: Pali Rohár <pali@kernel.org>
