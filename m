From: Prarit Bhargava <prarit@redhat.com>
Subject: Re: [PATCH 0/8] tools-power-x86-intel-speed-select: Fixes and updates
 for output
Date: Wed, 4 Sep 2019 16:55:28 -0400
Message-ID: <bab7688c-6ab6-16ad-d6f2-ade16af6892b@redhat.com>
References: <20190903153734.11904-1-prarit@redhat.com>
 <e6390a656dfd29b114b1e0659e3db169344cfa81.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e6390a656dfd29b114b1e0659e3db169344cfa81.camel@linux.intel.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: David Arcari <darcari@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



On 9/4/19 4:06 PM, Srinivas Pandruvada wrote:
> On Tue, 2019-09-03 at 11:37 -0400, Prarit Bhargava wrote:
>> Some general fixes and updates for intel-speed-select.  Fixes include
>> some
>> typos as well as an off-by-one cpu count reporting error.  Updates
>> for the
>> output are
>>
>> - switching to MHz as a standard
>> - reporting CPU frequencies instead of ratios as a standard
>> - viewing a human-readable CPU list.
>> - avoiding reporting "0|1" as success|fail as these can be confusing
>> for a
>>   user.
> Series looks fine, except 8/8.
> So please submit v2. Better to resubmit as a series as v2, unless Andy
> has other preference.

Thanks Srinivas.

I have an additional patch.  It looks like there's a memory leak.  Sorry for the
cut-and-paste but if okay I'll submit this as part of v2.  Reworking the code
this way makes it easier to introduce CascadeLake-N support too.

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/
intel-speed-select/isst-config.c
index 78f0cebda1da..59753b3917bb 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -603,6 +603,10 @@ static int isst_fill_platform_info(void)

        close(fd);

+       if (isst_platform_info.api_version > supported_api_ver) {
+               printf("Incompatible API versions; Upgrade of tool is required\n");
+               return -1;
+       }
        return 0;
 }

@@ -1528,6 +1532,7 @@ static void cmdline(int argc, char **argv)
 {
        int opt;
        int option_index = 0;
+       int ret;

        static struct option long_options[] = {
                { "cpu", required_argument, 0, 'c' },
@@ -1589,13 +1594,14 @@ static void cmdline(int argc, char **argv)
        set_max_cpu_num();
        set_cpu_present_cpu_mask();
        set_cpu_target_cpu_mask();
-       isst_fill_platform_info();
-       if (isst_platform_info.api_version > supported_api_ver) {
-               printf("Incompatible API versions; Upgrade of tool is required\n");
-               exit(0);
-       }
+       ret = isst_fill_platform_info();
+       if (ret)
+               goto out;

        process_command(argc, argv);
+out:
+       free_cpu_set(present_cpumask);
+       free_cpu_set(target_cpumask);
 }

 int main(int argc, char **argv)

P.
> 
> Thanks,
> Srinivas
> 
>>
>> Signed-off-by: Prarit Bhargava <prarit@redhat.com>
>> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>> Cc: David Arcari <darcari@redhat.com>
>> Cc: linux-kernel@vger.kernel.org
>>
>> Prarit Bhargava (8):
>>   tools/power/x86/intel-speed-select: Fix package typo
>>   tools/power/x86/intel-speed-select: Fix help option typo
>>   tools/power/x86/intel-speed-select: Fix cpu-count output
>>   tools/power/x86/intel-speed-select: Simplify output for turbo-freq
>> and
>>     base-freq
>>   tools/power/x86/intel-speed-select: Switch output to MHz
>>   tools/power/x86/intel-speed-select: Change turbo ratio output to
>>     maximum turbo frequency
>>   tools/power/x86/intel-speed-select: Output human readable CPU list
>>   tools/power/x86/intel-speed-select: Output success/failed for
>> command
>>     output
>>
>>  .../x86/intel-speed-select/isst-config.c      |   4 +-
>>  .../x86/intel-speed-select/isst-display.c     | 116 ++++++++++++--
>> ----
>>  2 files changed, 83 insertions(+), 37 deletions(-)
>>
> 
