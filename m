From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v5 10/11] intel_sgx: glue code for in-kernel LE
Date: Sat, 25 Nov 2017 14:52:22 +0200
Message-ID: <20171125125222.y5lmmockkyegydlz@linux.intel.com>
References: <20171117230705.GE25974@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:11991 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751129AbdKYMwS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 25 Nov 2017 07:52:18 -0500
Content-Disposition: inline
In-Reply-To: <20171117230705.GE25974@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 17, 2017 at 03:07:05PM -0800, Darren Hart wrote:
> On Mon, Nov 13, 2017 at 09:45:27PM +0200, Jarkko Sakkinen wrote:
> > Glue code for hosting in-kernel Launch Enclave (LE) by using the user
> > space helper framework.
> > 
> > Tokens for launching enclaves are generated with by the following
> > protocol:
> > 
> > 1. The driver sends a SIGSTRUCT blob to the LE hosting process
> >    to the input pipe.
> > 2. The LE hosting process reads the SIGSTRUCT blob from the input
> >    pipe.
> > 3. After generating a EINITTOKEN blob, the LE hosting process writes
> >    it to the output pipe.
> > 4. The driver reads the EINITTOKEN blob from the output pipe.
> > 
> > If IA32_SGXLEPUBKEYHASH* MSRs are writable and they don't have the
> > public key hash of the LE they will be updated.
> > 
> 
> A few nits throughout to keep in mind:
> 
> * #includes in alphabetical order in general
> * function local variables declared in order of decreasing line length
> * don't insert newlines where coding_style doesn't compel you to
> 
> > Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > -
> ...--
> > diff --git a/drivers/platform/x86/intel_sgx/sgx_le.c b/drivers/platform/x86/intel_sgx/sgx_le.c
> > new file mode 100644
> > index 000000000000..d49c58f09db6
> > --- /dev/null
> > +++ b/drivers/platform/x86/intel_sgx/sgx_le.c
> > @@ -0,0 +1,313 @@
> ...
> > +#include <linux/file.h>
> > +#include <linux/fs.h>
> > +#include <linux/kmod.h>
> > +#include <linux/mutex.h>
> > +#include <linux/wait.h>
> > +#include <linux/pipe_fs_i.h>
> > +#include <linux/sched/signal.h>
> > +#include <linux/shmem_fs.h>
> > +#include <linux/anon_inodes.h>
> 
> alphabetical order
> ...
> > +static int sgx_le_create_pipe(struct sgx_le_ctx *ctx,
> > +			      unsigned int fd)
> > +{
> > +	struct file *files[2];
> > +	int ret;
> > +
> > +	ret = create_pipe_files(files, 0);
> > +	if (ret)
> > +		goto out;
> 
> Fairly inconsistent in the use of the goto out: model and returning
> inline where there is no cleanup to be done. Whatever you do, please be
> consistent within the file.
> 
> If there is no cleanup to do, a local return is fine.

It is cruft that I haven't remembered to clean up eg there used to be
clean up. Thanks for spotting that.

/Jarkko
