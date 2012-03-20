From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 01/14] ACPI / Video: blacklist some samsung laptops
Date: Tue, 20 Mar 2012 16:05:37 +0000
Message-ID: <20120320160537.GB6192@srcf.ucam.org>
References: <1332233594-13099-1-git-send-email-corentin.chary@gmail.com>
 <1332233594-13099-2-git-send-email-corentin.chary@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1332233594-13099-2-git-send-email-corentin.chary@gmail.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Mar 20, 2012 at 09:53:01AM +0100, Corentin Chary wrote:
> From: Corentin Chary <corentincj@iksaif.net>
> 
> On these laptops, the ACPI video is not functional, and very unlikely
> to be fixed by the vendor. Note that intel_backlight works for some
> of these laptops, and the backlight from samsung-laptop always work.
> 
> The good news is that newer laptops have functional ACPI video device
> and won't end up growing this list.

Are the hotkeys delivered via ACPI or via the Samsung device? If the 
latter, you can just do unregister_acpi_video() instead in the samsung 
driver and avoid having more machine-specific quirks in the ACPi code.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
