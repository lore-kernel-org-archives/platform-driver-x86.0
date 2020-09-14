From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: initialize tp_nvram_state
 variable
Date: Mon, 14 Sep 2020 10:39:39 +0200
Message-ID: <a20bfbb6-65d4-2aef-1b78-15af329d77b4@redhat.com>
References: <20200913190203.22238-1-trix@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200913190203.22238-1-trix@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: trix@redhat.com, ibm-acpi@hmh.eng.br, dvhart@infradead.org, andy@infradead.org, natechancellor@gmail.com, ndesaulniers@google.com, len.brown@intel.com
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 9/13/20 9:02 PM, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analysis flags this represenative problem
> thinkpad_acpi.c:2523:7: warning: Branch condition evaluates
>    to a garbage value
>                  if (!oldn->mute ||
>                      ^~~~~~~~~~~
> 
> In hotkey_kthread() mute is conditionally set by hotkey_read_nvram()
> but unconditionally checked by hotkey_compare_and_issue_event().
> So the tp_nvram_state variable s[2] needs to be initialized.
> 
> Fixes: 01e88f25985d ("ACPI: thinkpad-acpi: add CMOS NVRAM polling for hot keys (v9)")

Looking at the code I do not think this can actually happen,
this can only happen if the poll_mask == 0 the first time
through the loop so s[1] does never gets initialized and then
the second time to the loop poll_mask != 0, but if poll_mask
changes then we hit:

                 mutex_lock(&hotkey_thread_data_mutex);
                 if (was_frozen || hotkey_config_change != change_detector) {
                         /* forget old state on thaw or config change */
                         si = so;
                         t = 0;
                         change_detector = hotkey_config_change;
                 }

Where we set si = so so then this can also not happen.

I can understand the static-analyzer warning about this, and fixing
that warning is good. But I doubt that this warrants a fixes tag.

So with the Fixes tag dropped this is:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>


> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/platform/x86/thinkpad_acpi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 47925c319d7b..24da8b6872f2 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -2573,7 +2573,7 @@ static void hotkey_compare_and_issue_event(struct tp_nvram_state *oldn,
>    */
>   static int hotkey_kthread(void *data)
>   {
> -	struct tp_nvram_state s[2];
> +	struct tp_nvram_state s[2] = { 0 };
>   	u32 poll_mask, event_mask;
>   	unsigned int si, so;
>   	unsigned long t;
> 
