From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/2] ABI: ibm_rtl: the "What:" fields are incomplete
Date: Tue, 1 Nov 2016 09:21:33 -0700
Message-ID: <20161101162133.GB3215@f23x64.localdomain>
References: <364a36215c44e0c2785911e9d9259cd866283cb9.1477735797.git.mchehab@s-opensource.com>
 <650a057df924aff3b70a445694fcb1e3af524c8d.1477735797.git.mchehab@s-opensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <650a057df924aff3b70a445694fcb1e3af524c8d.1477735797.git.mchehab@s-opensource.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>, corbet@lwn.net
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Vernon Mauery <vernux@us.ibm.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Oct 29, 2016 at 08:10:03AM -0200, Mauro Carvalho Chehab wrote:
> The "What:" field at the ABI should describe the location of
> the ABI, e. g. the position under a mounted sysfs. However,
> this file has only the basename without the path.
> 
> Fix it.
> 
> Cc: Vernon Mauery <vernux@us.ibm.com>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>

Jon,

Is it OK with you if I push this through my platform driver x86 tree?

Thanks,

Darren

> ---
>  Documentation/ABI/testing/sysfs-devices-system-ibm-rtl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-system-ibm-rtl b/Documentation/ABI/testing/sysfs-devices-system-ibm-rtl
> index b82deeaec314..470def06ab0a 100644
> --- a/Documentation/ABI/testing/sysfs-devices-system-ibm-rtl
> +++ b/Documentation/ABI/testing/sysfs-devices-system-ibm-rtl
> @@ -1,4 +1,4 @@
> -What:           state
> +What:           /sys/devices/system/ibm_rtl/state
>  Date:           Sep 2010
>  KernelVersion:  2.6.37
>  Contact:        Vernon Mauery <vernux@us.ibm.com>
> @@ -10,7 +10,7 @@ Description:    The state file allows a means by which to change in and
>  Users:          The ibm-prtm userspace daemon uses this interface.
>  
>  
> -What:           version
> +What:           /sys/devices/system/ibm_rtl/version
>  Date:           Sep 2010
>  KernelVersion:  2.6.37
>  Contact:        Vernon Mauery <vernux@us.ibm.com>
> -- 
> 2.7.4
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
