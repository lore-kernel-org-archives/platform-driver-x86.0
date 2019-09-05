From: Prarit Bhargava <prarit@redhat.com>
Subject: Re: [PATCH v2 9/9] tools/power/x86/intel-speed-select: Fix memory
 leak
Date: Thu, 5 Sep 2019 17:00:13 -0400
Message-ID: <13983f13-098e-4390-c014-43b59c4e2f27@redhat.com>
References: <20190905120311.15286-1-prarit@redhat.com>
 <20190905120311.15286-10-prarit@redhat.com>
 <f12560e59427ce7e038334a3b59bf084a748d998.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f12560e59427ce7e038334a3b59bf084a748d998.camel@linux.intel.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, platform-driver-x86@vger.kernel.org
Cc: andriy.shevchenko@intel.com, David Arcari <darcari@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



On 9/5/19 3:42 PM, Srinivas Pandruvada wrote:
> On Thu, 2019-09-05 at 08:03 -0400, Prarit Bhargava wrote:
>> cpumasks are allocated by calling the alloc_cpu_mask() function and
>> are
>> never free'd.  They should be free'd after the commands have run.
>>
>> Fix the memory leaks by calling free_cpu_set().
> Good to fix this. But after one command execution the process will
> exit.
> 

I'm sorry, I misunderstood your comment.  Yes, the process will exit after one
command :)

P.

> Thanks,
> Srinivas
> 
>>
>> Signed-off-by: Prarit Bhargava <prarit@redhat.com>
>> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>> Cc: David Arcari <darcari@redhat.com>
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>  tools/power/x86/intel-speed-select/isst-config.c | 16 +++++++++++---
>> --
>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/tools/power/x86/intel-speed-select/isst-config.c
>> b/tools/power/x86/intel-speed-select/isst-config.c
>> index 78f0cebda1da..59753b3917bb 100644
>> --- a/tools/power/x86/intel-speed-select/isst-config.c
>> +++ b/tools/power/x86/intel-speed-select/isst-config.c
>> @@ -603,6 +603,10 @@ static int isst_fill_platform_info(void)
>>  
>>  	close(fd);
>>  
>> +	if (isst_platform_info.api_version > supported_api_ver) {
>> +		printf("Incompatible API versions; Upgrade of tool is
>> required\n");
>> +		return -1;
>> +	}
>>  	return 0;
>>  }
>>  
>> @@ -1528,6 +1532,7 @@ static void cmdline(int argc, char **argv)
>>  {
>>  	int opt;
>>  	int option_index = 0;
>> +	int ret;
>>  
>>  	static struct option long_options[] = {
>>  		{ "cpu", required_argument, 0, 'c' },
>> @@ -1589,13 +1594,14 @@ static void cmdline(int argc, char **argv)
>>  	set_max_cpu_num();
>>  	set_cpu_present_cpu_mask();
>>  	set_cpu_target_cpu_mask();
>> -	isst_fill_platform_info();
>> -	if (isst_platform_info.api_version > supported_api_ver) {
>> -		printf("Incompatible API versions; Upgrade of tool is
>> required\n");
>> -		exit(0);
>> -	}
>> +	ret = isst_fill_platform_info();
>> +	if (ret)
>> +		goto out;
>>  
>>  	process_command(argc, argv);
>> +out:
>> +	free_cpu_set(present_cpumask);
>> +	free_cpu_set(target_cpumask);
>>  }
>>  
>>  int main(int argc, char **argv)
> 
