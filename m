From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Read EC information on
 newer models
Date: Fri, 8 Mar 2019 14:39:44 +0100
Message-ID: <20190308133944.GA22787@kroah.com>
References: <20190308131426.10254-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190308131426.10254-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: ibm-acpi@hmh.eng.br, dvhart@infradead.org, andy@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 08, 2019 at 09:14:26PM +0800, Jiaxun Yang wrote:
> Newer ThinkPads have a totally different EC program information DMI
> table. And thermal subdriver can't work without correct EC version.
> 
> Read from this entry if the old method failed to get EC information.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 62 ++++++++++++++++++++++------
>  1 file changed, 49 insertions(+), 13 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
