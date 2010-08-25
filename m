From: Cesar Eduardo Barros <cesarb@cesarb.net>
Subject: intel ips: CPU TDP doesn't match expected value
Date: Tue, 24 Aug 2010 21:48:45 -0300
Message-ID: <4C74686D.8090707@cesarb.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>, Matthew Garrett <mjg@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

I get the following messages on v2.6.36-rc2-203-g502adf5:

intel ips 0000:00:1f.6: Warning: CPU TDP doesn't match expected value 
(found 25, expected 35)
intel ips 0000:00:1f.6: PCI INT C -> GSI 18 (level, low) -> IRQ 18
intel ips 0000:00:1f.6: IPS driver initialized, MCP temp limit 65535
intel ips 0000:00:1f.6: MCP power or thermal limit exceeded
intel ips 0000:00:1f.6: CPU power or thermal limit exceeded

(The last two messages repeat very often, one of them every five 
seconds; if I understand it correctly, that is normal and expected.)

The code implies the "CPU TDP doesn't match expected value" is a sanity 
check failing. Should that happen, or is there something wrong?


/proc/cpuinfo for the first core:
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 37
model name	: Intel(R) Core(TM) i3 CPU       M 330  @ 2.13GHz
stepping	: 2
cpu MHz		: 933.000
cache size	: 3072 KB
physical id	: 0
siblings	: 4
core id		: 0
cpu cores	: 2
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 11
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov 
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx 
rdtscp lm constant_tsc arch_perfmon pebs bts rep_good xtopology 
nonstop_tsc aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 
xtpr pdcm sse4_1 sse4_2 popcnt lahf_lm arat tpr_shadow vnmi flexpriority 
ept vpid
bogomips	: 4256.29
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:

/sys/devices/virtual/dmi/id/:
bios_date: 06/21/2010
bios_vendor: Dell Inc.
bios_version: A05
board_asset_tag:
board_name: 07NTDG
board_vendor: Dell Inc.
board_version: A05
chassis_asset_tag:
chassis_type: 8
chassis_vendor: Dell Inc.
chassis_version: A05
product_name: Inspiron N4010
product_version: A05
sys_vendor: Dell Inc.

-- 
Cesar Eduardo Barros
cesarb@cesarb.net
cesar.barros@gmail.com
