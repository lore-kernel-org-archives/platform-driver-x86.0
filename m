From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: disable bluetooth for some
 machines
Date: Thu, 7 Mar 2019 12:20:41 +0100
Message-ID: <20190307112041.GC13633@kroah.com>
References: <20190307080820.9723-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190307080820.9723-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: ibm-acpi@hmh.eng.br, dvhart@infradead.org, andy@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Mar 07, 2019 at 04:08:20PM +0800, Jiaxun Yang wrote:
> Some AMD based ThinkPads have a firmware bug that calling
> "GBDC" will cause bluetooth on Intel wireless cards blocked.
> 
> Probe these models by DMI match and disable bluetooth subdriver
> if specified Intel wireless card exist.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 70 ++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
