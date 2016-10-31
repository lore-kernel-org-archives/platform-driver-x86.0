From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] platform/x86/asus-nb-wmi.c: Add X45U quirk
Date: Mon, 31 Oct 2016 15:33:56 -0600
Message-ID: <20161031213356.GC15739@kroah.com>
References: <1477945272-4703-1-git-send-email-marcos.souza.org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477945272-4703-1-git-send-email-marcos.souza.org@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Cc: corentin.chary@gmail.com, dvhart@infradead.org, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 31, 2016 at 06:21:12PM -0200, Marcos Paulo de Souza wrote:
> Without this patch, the Asus X45U wireless card can't be turned
> on (hard-blocked), but after a suspend/resume it just starts working.
> 
> Following this bug report[1], there are other cases like this one, but
> this Asus is the only model that I can test.
> 
> [1] https://ubuntuforums.org/showthread.php?t=2181558
> 
> Signed-off-by: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>
