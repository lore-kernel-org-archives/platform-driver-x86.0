From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2] platform: uv: fix missing checks for kcalloc
Date: Tue, 23 Apr 2019 13:02:43 -0700
Message-ID: <CAGXu5jJ_MdFE_aTc9rFY9SwympdXdJA9WhdaaPJo4UvP9OaqDg@mail.gmail.com>
References: <20190325125528.GM12016@zn.tnic> <20190325202924.4624-1-kjlu@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190325202924.4624-1-kjlu@umn.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Kangjie Lu <kjlu@umn.edu>
Cc: pakki001@umn.edu, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Kees Cook <keescook@chromium.org>, Andrew Banman <abanman@hpe.com>, Varsha Rao <rvarsha016@gmail.com>, Colin Ian King <colin.king@canonical.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Nicolai Stange <nstange@suse.de>, Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 25, 2019 at 1:29 PM Kangjie Lu <kjlu@umn.edu> wrote:
>
> In case kcalloc fails, the patch return an error to avoid
> potential NULL pointer dereference.
>
> Signed-off-by: Kangjie Lu <kjlu@umn.edu>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

>
> ---
> v2: reuse existing error path as suggested by
> Borislav Petkov <bp@alien8.de>
> ---
>  arch/x86/platform/uv/tlb_uv.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
> index 2c53b0f19329..7b41b51b9a86 100644
> --- a/arch/x86/platform/uv/tlb_uv.c
> +++ b/arch/x86/platform/uv/tlb_uv.c
> @@ -2133,14 +2133,18 @@ static int __init summarize_uvhub_sockets(int nuvhubs,
>   */
>  static int __init init_per_cpu(int nuvhubs, int base_part_pnode)
>  {
> -       unsigned char *uvhub_mask;
>         struct uvhub_desc *uvhub_descs;
> +       unsigned char *uvhub_mask = NULL;
>
>         if (is_uv3_hub() || is_uv2_hub() || is_uv1_hub())
>                 timeout_us = calculate_destination_timeout();
>
>         uvhub_descs = kcalloc(nuvhubs, sizeof(struct uvhub_desc), GFP_KERNEL);
> +       if (!uvhub_descs)
> +               goto fail;
>         uvhub_mask = kzalloc((nuvhubs+7)/8, GFP_KERNEL);
> +       if (!uvhub_mask)
> +               goto fail;
>
>         if (get_cpu_topology(base_part_pnode, uvhub_descs, uvhub_mask))
>                 goto fail;
> --
> 2.17.1
>


-- 
Kees Cook
