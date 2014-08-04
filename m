From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH 2/2] toshiba_acpi: Add Qosmio X75-A to the alt keymap dmi
 list
Date: Mon, 4 Aug 2014 11:19:49 -0700
Message-ID: <20140804181949.GB15598@kroah.com>
References: <1407165662-1971-1-git-send-email-coproscefalo@gmail.com>
 <1407165662-1971-3-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1407165662-1971-3-git-send-email-coproscefalo@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Aug 04, 2014 at 09:21:02AM -0600, Azael Avalos wrote:
> The Toshiba Qosmio X75-A series models also come with
> the new keymap layout.
> 
> This patch adds this model to the alt_keymap_dmi list,
> along with an extra key found on these models.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
>  drivers/platform/x86/toshiba_acpi.c | 7 +++++++
>  1 file changed, 7 insertions(+)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>
