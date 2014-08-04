From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH 0/2] toshiba_acpi: Qosmio backlight and keymap fixes
Date: Mon, 4 Aug 2014 11:19:56 -0700
Message-ID: <20140804181956.GC15598@kroah.com>
References: <1407165662-1971-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1407165662-1971-1-git-send-email-coproscefalo@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Aug 04, 2014 at 09:21:00AM -0600, Azael Avalos wrote:
> The following two patches fixes some issues regarding
> the backlight method on Qosmios series X500/X505 and
> X75-A (and probably others too), as well as adding
> the latter to the new alternate keymap list.
> 
> Azael Avalos (2):
>   toshiba_acpi: Add extra check to backlight code
>   toshiba_acpi: Add Qosmio X75-A to the alt keymap dmi list
> 
>  drivers/platform/x86/toshiba_acpi.c | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>
